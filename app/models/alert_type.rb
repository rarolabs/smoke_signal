class AlertType < ActiveRecord::Base
   attr_accessible :alert_ids, :constraint_ids, :title, :description, :key, :system_id
   has_many :alerts
   has_many :constraints
   belongs_to :system
   
   def obeys_constraint?(c)
     self.constraints.each do |constraint|
       return false unless (c[constraint.field_name].present? and c[constraint.field_name] == constraint.value) 
     end
     return true
   end
end
