class EventProcessor
  @queue = :events_queue
  def self.perform(event)
    puts "#{event}"
  end
end