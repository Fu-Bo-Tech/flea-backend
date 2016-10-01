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

  private
  def assign_character
    self.character = Character.take_free
  end
end
