class EventProcessor
  @queue = :events_queue
  
  def self.perform(event)
    @system = System.find_by_name(event["system"])
    @constraints = eval event["constraints"]
    @keys = eval event["keys"]
    
    if @system.present?
      @keys.each do |k,v|
        alert_type = AlertType.where("system_id = ? and alert_types.key = ?",@system.id,k).first
        if alert_type.present?
          alert_type.alerts.each do |alert|
            if alert.houve_alarme?(v)
              alert.enviar_alarme
            else
              puts "Nao houve alarme"  
            end 
          end
        end
      end
    end
    
  end
end