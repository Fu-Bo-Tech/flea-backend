class Good < ApplicationRecord
  belongs_to :owner, class_name: 'User', foreign_key: 'user_id'
  has_many :biddings, -> { readonly }
  validates_presence_of :owner

  def max_bidding_amount
    biddings.maximum('amount') || 0
  end
end
