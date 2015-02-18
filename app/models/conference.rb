class Conference < ActiveRecord::Base
#  attr_accessible :num
  validates :num, presence: true
  has_and_belongs_to_many :accounts
  accepts_nested_attributes_for :accounts
end
