
  

class Event < ActiveRecord::Base
  
  include SmokeSignalClient::SmokeSignal
  
  attr_accessible :data_type, :key, :system, :valor
  
  alarm [:key] do
     set :data_type, :DEMANDA_ATIVA
     set :key , :DEMANDA_REATIVA
  end
  

end

