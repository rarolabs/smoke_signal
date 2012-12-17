class System < ActiveRecord::Base
   attr_accessible :name, :token
   has_many :alert_types
end
