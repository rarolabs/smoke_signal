class Alert < ActiveRecord::Base
   attr_accessible :operator, :limit, :mail_list, :alert_type_id, :active, :owner_id, :owner
   belongs_to :alert_type
   belongs_to :owner
   
   def houve_alarme?(valor)
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
   
   def enviar_alarme
     puts "Sending email alarm - #{self.alert_type.description}"
   end
   
   def check!(v)
     if self.houve_alarme?(v)
       self.enviar_alarme
     else
       puts "No alert"  
     end  
   end
   
end
