class User < ActiveRecord::Base
  has_secure_password
  has_many :friendships
  has_many :friends, through: :friendships
  # has_many :secrets
  # has_many :likes

  # has_many :likes, through: :secrets
  # has_many :liked_secrets, :through=> :likes, :source => :secrets

  validates :name, :password_confirmation, :description, presence: true
  validates :password, presence: true, length: { minimum: 8 }
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
end