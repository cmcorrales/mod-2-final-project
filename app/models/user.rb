class User < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  validates :user_name, uniqueness: true, presence: true, length: { maximum: 255 }

  has_secure_password
  validates :password, length: { minimum: 6 }

end
