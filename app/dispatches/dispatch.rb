class Dispatch

   def initialize(contact,title,text)
     @text = text
     @contact = contact
     @title = title
     send_message
   end
   # 
   # def send
   # end

end