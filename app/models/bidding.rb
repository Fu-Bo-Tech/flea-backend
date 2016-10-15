class Bidding < ApplicationRecord
  EXTENDED_GAP = 10
  belongs_to :user
  belongs_to :good

  validate :should_be_greater_than_others, :should_before_end_of_bidding_time
  before_update { raise ActiveRecord::ReadOnlyRecord }
  after_create :check_or_extend_bidding_time

  private def should_be_greater_than_others
    gap = good.extended? ? EXTENDED_GAP : 1
    return true if good.max_bidding_amount + gap <= amount
    errors.add(:amount, "should be greater than previous bidding for #{gap} NTD!")
  end

  private def should_before_end_of_bidding_time
    return true if good.in_bidding_time?
    errors.add(:base, 'should bid before end of the bidding time!')
  end

  private def check_or_extend_bidding_time
    good.check_or_extend_bidding_time!
  end
end
