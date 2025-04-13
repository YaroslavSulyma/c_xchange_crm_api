class User < ApplicationRecord
  MIN_PASSWORD_SIZE = 8
  EMAIL_REGEXP = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  has_secure_password

  has_many :trades, dependent: :destroy
end
