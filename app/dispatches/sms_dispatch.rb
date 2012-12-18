class SmsDispatch < Dispatch
  
  def send_message
    puts "**************SEND SMS - #{@title}********************"
    puts @text
    puts @contact
    puts "******************************************************"
  end
end