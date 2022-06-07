class User < ApplicationRecord
  # Name validation
  validates :name, presence: true, length: {maximum: 50}
  
  # Email validation
  before_save {email.downcase!}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255},
                    format: {with: VALID_EMAIL_REGEX},
                    uniqueness: true
                    
  # Password validation                  
  has_secure_password
  validates :password, presence: true, length: {minimum: 6}
  
end
