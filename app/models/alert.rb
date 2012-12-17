class Alert < ActiveRecord::Base
   attr_accessible :operator, :limit, :mail_list, :alert_type_id
   belongs_to :alert_type
   
   def was_alert?(valor)
    if self.operator == "igual"
      return valor == self.limit
    elsif self.operator == "maior"
      return valor > self.limit
    elsif self.operator == "menor"
      return valor < self.limit
    elsif self.operator == "maior ou igual"
      return valor >= self.limit
    elsif self.operator == "menor ou igual"
      return valor <= self.limit
    end
   end
   
   def send_alert
     puts "Sending email alarm - #{self.alert_type.description}"
   end
   
   def check!(v)
     if self.was_alert?(v)
       self.send_alert
     else
       puts "No alert"  
     end  
   end
   
end
