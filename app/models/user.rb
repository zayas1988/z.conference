class User < ActiveRecord::Base
  has_many :numbers
  accepts_nested_attributes_for :numbers
end
