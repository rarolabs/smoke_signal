class Alert < ActiveRecord::Base
   attr_accessible :operator, :limit, :mail_list, :alert_type_id

   belongs_to :alert_type
   
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
     puts "Sending email alarm - #{self.alert_type.description}"
     self.alert_type.alert_templates.each do |template|
       notification = template.gsub("##operator", "#{operator}").gsub("##limit", "#{limit}").gsub("##value", "#{value}")
       puts "****************TEMPLATE**********#{notification}"
     end
   end
   
   def check!(value)
     if self.was_alert?(value)
       self.send_alert(value)
     else
       puts "No alert"  
     end  
   end
   
end
