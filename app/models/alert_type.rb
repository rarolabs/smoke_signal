class AlertType < ActiveRecord::Base
   attr_accessible :alert_ids, :constraint_ids, :title, :description, :key, :system_id
   has_many :alerts
   has_many :constraints
   has_many :templates
   belongs_to :system
   
   validates_presence_of :title, :description, :key
   validates_uniqueness_of :system_id, :scope => :key
   # validates_uniqueness_of :key (Somente quanto o sistema é igual)
   validates_associated :system
   
   def obeys_constraint?(c)
     self.constraints.each do |constraint|
       return false unless (c[constraint.field_name].present? and c[constraint.field_name] == constraint.value) 
     end
     return true
   end
   
   def alert_templates
     temp = []
     self.templates.each do |template|
        temp << {:message_type => template.message_type, :text => template.text.gsub("##system", "#{system.name}").gsub("##description", "#{description}").gsub("##title", "#{title}").gsub("##key", "#{key}") }
     end
     return temp
   end
end
