class System < ActiveRecord::Base
   attr_accessible :name, :token
   has_many :alert_types
   has_many :owners
end
