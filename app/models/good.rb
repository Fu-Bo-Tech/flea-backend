class Good < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  belongs_to :event
  has_many :biddings, -> { readonly }
  validates_presence_of :owner
  before_create :init_bidding_time

  def max_bidding_amount
    biddings.maximum('amount') || 0
  end

  def extend_bidding_time!(len)
    self.bidding_time += len.minutes
    save!
  end

  def bidding_time_left
    ((bidding_time.to_datetime - DateTime.now) * 24 * 60).to_i
  end

  def in_bidding_time?
    bidding_time.to_datetime > DateTime.now
  end

  private def init_bidding_time
    self.bidding_time = event.end_time
  end
end
