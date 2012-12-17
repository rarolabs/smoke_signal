class Constraint < ActiveRecord::Base
   attr_accessible :field_name, :value, :alert_type_id
   belongs_to :alert_type
end
