class Good < ApplicationRecord
  EXTEND_TIME_SERIES = [3, 3, 3].freeze
  EXTEND_TIME_MIN = 1
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  belongs_to :event
  has_many :biddings, -> { readonly; order('amount DESC') }
  validates_presence_of :owner
  before_create :init_bidding_time

  def max_bidding_amount
    biddings.maximum('amount') || 0
  end

  def check_or_extend_bidding_time!
    extend_bidding_time!(calculate_extend_time(extended_count)) if need_to_extended?
  end

  def extended?
    extended_count > 0
  end

  def need_to_extended?
    bidding_time_left < calculate_extend_time([0, extended_count - 1].max)
  end

  def highest_bidding
    biddings.first
  end

  private def extend_bidding_time!(len)
    self.bidding_time  += len.minutes
    self.extended_count += 1
    save!
  end

  private def calculate_extend_time(extended_count)
    EXTEND_TIME_SERIES[extended_count] || EXTEND_TIME_MIN
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
