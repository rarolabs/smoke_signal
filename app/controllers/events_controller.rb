class EventsController < ApplicationController
  def create
    @event = params
    Resque.enqueue(EventProcessor, @event)
    render :text => "OK"
  end
end
