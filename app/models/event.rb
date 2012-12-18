
class Event < ActiveRecord::Base
  
  include SmokeSignalClient::SmokeSignal
  
  attr_accessible :data_type, :key, :system, :valor
  
  alarm [:key,:data_type] do
     set :valor, :DAFP
  end
end

