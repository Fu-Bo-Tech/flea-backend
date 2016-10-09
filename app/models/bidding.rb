class Bidding < ApplicationRecord
  belongs_to :user
  belongs_to :good

  validate :should_be_greater_than_others, :should_before_end_of_bidding_time
  before_update { raise ActiveRecord::ReadOnlyRecord }
  after_create :check_or_extend_bidding_time

  private def should_be_greater_than_others
    return true if good.max_bidding_amount < amount
    errors.add(:amount, 'should be greater than other biddings!')
  end

  private def should_before_end_of_bidding_time
    return true if good.in_bidding_time?
    errors.add(:base, 'should bid before end of the bidding time!')
  end

  private def check_or_extend_bidding_time
    good.extend_bidding_time!(10) if good.bidding_time_left < 10
  end
end
