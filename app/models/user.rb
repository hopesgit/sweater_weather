class User < ApplicationRecord
  has_secure_password
  validates :email, email: {mode: :strict}, uniqueness: true
  validates :api_key, presence: true, uniqueness: true
end
