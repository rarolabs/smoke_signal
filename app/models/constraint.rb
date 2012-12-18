class Constraint < ActiveRecord::Base
   attr_accessible :field_name, :value, :alert_type_id
   belongs_to :alert_type
   
   validates_presence_of :field_name, :value
   validates_uniqueness_of :alert_type_id, :scope => :field_name
   validates_associated :alert_type

end
