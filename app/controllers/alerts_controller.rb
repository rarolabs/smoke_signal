# encoding: UTF-8

class AlertsController < ApplicationController
  before_filter :authenticate
  
  
  def authenticate

    authenticate_with_http_basic do |owner, system| 
      @system = system
    end

  end

  respond_to :xml, :json
  def index
    respond_with(@alerts = Alert.all) #(:alert_type => [:system]).where("systems.token = ?", @system))
  end
  
  def create
    params[:alert][:owner] = @owner
    @alert = Alert.create(params[:alert])
    respond_with(@alert, :location => alerts_url)
  end
  
  def update 
    @alert = Alert.find(params[:id])
    if @alert.owner == @owner
      params[:alert].delete(:created_at)
      params[:alert].delete(:id)
      params[:alert].delete(:updated_at)
            
      @alert.update_attributes(params[:alert])
      respond_with(@alert, :location => alerts_url)
    end
  end


  def destroy 
    @alert = Alert.find(params[:id])
    if @alert.owner == @owner
      @alert.destroy
      respond_with(@alert, :location => alerts_url)
    end
  end


end
