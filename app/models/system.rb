class System < ActiveRecord::Base
   attr_accessible :name, :token
   has_many :alert_types

   validates_presence_of :name
   validates_uniqueness_of :name

end
