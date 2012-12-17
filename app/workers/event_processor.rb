class EventProcessor
  @queue = :events_queue
  
  def self.perform(event)
    @system = System.find_by_name(event["system"])
    @constraints = ActiveSupport::JSON.decode(event["constraints"].gsub(":", "\"").gsub("=>", "\":").gsub("nil","null"))
    @keys = ActiveSupport::JSON.decode(event["keys"].gsub(":", "\"").gsub("=>", "\":").gsub("nil","null"))
    if @system.present?
      @keys.each do |k,v|
        alert_type = AlertType.where("system_id = ? and alert_types.key = ?",@system.id,k).first
        if alert_type.present?
          alert_type.alerts.each do |alert|
            alert.check!(v)
          end
        end
      end
    end
    
  end
end