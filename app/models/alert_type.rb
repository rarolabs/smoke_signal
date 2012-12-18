class AlertType < ActiveRecord::Base
   attr_accessible :alert_ids, :constraint_ids, :title, :description, :key, :system_id
   has_many :alerts
   has_many :constraints
   has_many :templates
   belongs_to :system
   
   def obeys_constraint?(c)
     self.constraints.each do |constraint|
       return false unless (c[constraint.field_name].present? and c[constraint.field_name] == constraint.value) 
     end
     return true
   end
   
   def alert_templates
     temp = []
     self.templates.each do |template|
        temp << template.text.gsub("##system", "#{system.name}").gsub("##description", "#{description}").gsub("##title", "#{title}")
     end
     return temp
   end
end
