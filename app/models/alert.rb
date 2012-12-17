class Alert < ActiveRecord::Base
   attr_accessible :operator, :limit, :list_mail, :alert_type_id, :created_at, :id, :updated_at
   

   belongs_to :alert_type
   
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
     puts "Enviando email do alarme #{self.alert_type.describe}"
   end
end
