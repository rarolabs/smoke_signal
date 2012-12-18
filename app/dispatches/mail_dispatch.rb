class MailDispatch < Dispatch
  
  def send_message
    puts "**************SEND MAIL - #{@title}*******************"
    puts @text
    puts @contact
    puts "******************************************************"
  end
  
end