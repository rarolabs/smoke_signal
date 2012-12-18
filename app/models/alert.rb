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
       notification = template[:text].gsub("##operator", "#{operator}").gsub("##limit", "#{limit}").gsub("##value", "#{value}").gsub("##rule", "Value #{operator} #{limit}")
       class_name = (template[:message_type].titleize + "Dispatch").constantize
       class_name.new(self.mail_list, self.alert_type.title, notification)
     end
   end
   
   def check!(value)
     if self.active and self.was_alert?(value)
       self.send_alert(value)
     else
       if self.active
         puts "No alert"
       else
         puts "No active"
       end  
     end  
   end
   
end
