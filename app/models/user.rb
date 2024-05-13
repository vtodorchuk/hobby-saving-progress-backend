class User < ApplicationRecord
  encrypts :monobank_token

  has_secure_password

  validates :password, presence: true
end
