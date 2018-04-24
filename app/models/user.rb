class User < ActiveRecord::Base
  has_secure_password

  # has_many :songs through: :lists
  has_many :lists

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true, length: { :maximum => 50 }
  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_REGEX }

  before_create do
    self.email = email.downcase
  end
end
