class Alert < ActiveRecord::Base
   attr_accessible :operator, :limit, :mail_list, :owner, :active, :alert_type_id

   belongs_to :alert_type
   
   validates_presence_of :operator, :limit, :mail_list, :owner
   validates_associated :alert_type
   
   def was_alert?(value)
    if self.operator == "igual"
      return value == self.limit
    elsif self.operator == "maior"
      return value > self.limit
    elsif self.operator == "menor"
      return value < self.limit
    elsif self.operator == "maior ou igual"
      return value >= self.limit
    elsif self.operator == "menor ou igual"
      return value <= self.limit
    end
   end
   
   def send_alert(value)
     puts "No template" unless self.alert_type.alert_templates.present?
     self.alert_type.alert_templates.each do |template|
       puts "Sending #{template[:message_type]} alarm - #{self.alert_type.key}"
       notification = template[:text].gsub("##operator", "#{operator}").gsub("##limit", "#{limit}").gsub("##value", "#{value}").gsub("##rule", "Value #{operator} #{limit}")
       puts "****************TEMPLATE**************"
       puts "#{notification}"
       puts "**************************************"
     end
   end
   
   def check!(value)
     if self.is_active? and self.was_alert?(value)
       self.send_alert(value)
     else
       if self.is_active?
         puts "No alert"
       else
         puts "No active"
       end  
     end  
   end
   
   def is_active?
      self.active
   end
   
end
