class Conference < ActiveRecord::Base
#  attr_accessible :num
  validates :num, presence: true
  has_and_belongs_to_many :accounts
end
