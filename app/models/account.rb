class Account < ActiveRecord::Base
  attr_accessible :name, :email
  validates :name, presence: true
  validates :email, presence: true
  has_and_belongs_to_many :conferences
end
