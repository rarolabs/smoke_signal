class Template < ActiveRecord::Base
   attr_accessible :text, :message_type, :alert_type_id
   belongs_to :alert_type
   
   validates_presence_of :text, :message_type
   validates_uniqueness_of :alert_type_id, :scope => :message_type
   validates_associated :alert_type
   
   def sms?
     self.message_type == "SMS"
   end
   
   def mail?
     self.message_type == "MAIL"
   end
end
