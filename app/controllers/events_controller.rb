class EventsController < ApplicationController
  def create
    puts "Chegou"
    @event = params
    Resque.enqueue(EventProcessor, @event)
    render :text => "OK"
  end
end
