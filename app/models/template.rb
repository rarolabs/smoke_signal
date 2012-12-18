class Template < ActiveRecord::Base
   attr_accessible :text, :message_type, :alert_type_id
   belongs_to :alert_type
   
   
   def sms?
     self.message_type == "SMS"
   end
   
   def mail?
     self.message_type == "MAIL"
   end
end
