class Bidding < ApplicationRecord
  belongs_to :user
  belongs_to :good

  validate :should_be_greater_than_others
  before_update { raise ActiveRecord::ReadOnlyRecord }

  private def should_be_greater_than_others
    return true if good.max_bidding_amount < amount
    errors.add(:amount, 'should be greater than other biddings!')
  end
end
