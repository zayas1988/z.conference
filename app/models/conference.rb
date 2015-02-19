class Conference < ActiveRecord::Base
#  attr_accessible :num
  validates :num, presence: true
  has_and_belongs_to_many :accounts
  has_and_belongs_to_many :users
  accepts_nested_attributes_for :accounts
  accepts_nested_attributes_for :users
end
