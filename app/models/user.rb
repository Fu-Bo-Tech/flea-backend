class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  has_many :goods
  has_many :biddings, -> { readonly }
  has_one :character
  delegate :name, to: :character, prefix: :fake

  before_create :assign_character
  validate :only_accept_specific_email_domain

  def joined_goods
    Good.joins(:biddings).where(biddings: {user: self}).distinct
  end

  private def only_accept_specific_email_domain
    return true if email =~ /@(happygorgi|hopebaytech).com/
    errors.add(:email, 'should be happygorgi.com or hopebaytech.com domain')
  end

  private def assign_character
    self.character = Character.take_free
  end
end
