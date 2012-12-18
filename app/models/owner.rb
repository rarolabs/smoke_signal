class Owner < ActiveRecord::Base
  attr_accessible :name
  has_many :alerts
  belongs_to :system
end
