

class Event < ActiveRecord::Base
  
  include SmokeSignalClient::SmokeSignal
  
  attr_accessible :data_type, :key, :system, :valor
  
  alarm [:key] do
     set :data_type , :AT1
     set :valor, :AN1
  end
end

