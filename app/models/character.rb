class Character < ApplicationRecord
  belongs_to :user, optional: true

  def self.take_free
    where(user: nil).order('RANDOM()').first
  end
end
