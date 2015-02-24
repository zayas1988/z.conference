class Account < ActiveRecord::Base
#  attr_accessible :name, :email
  before_save { self.email = email.downcase }
  validates :name, presence: true
  validates :email, presence: true
  has_and_belongs_to_many :conferences
  accepts_nested_attributes_for :conferences
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 6 }
end
