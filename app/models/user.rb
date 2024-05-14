class User < ApplicationRecord
  encrypts :monobank_token
  has_secure_password

  validates :email, presence: true
  validates :first_name, :last_name, presence: true, length: 0..255
end
