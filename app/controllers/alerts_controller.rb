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
    unless params[:key].present?
       @alerts = Alert.joins(:alert_type).where(:owner => params[:owner])
     else
       @alerts = Alert.joins(:alert_type).where("owner = ? and alert_types.key = ? ", params[:owner],params[:key])
     end
    respond_with(@alerts)
  end
  
  def create
    @alert = Alert.create(params[:alert])
    respond_with(@alert)
  end
  
  def update 
    @alert = Alert.find(params[:id])
    @alert.update_attributes(params[:alert])
    @alert.update_attributes(params[:alert])
    respond_with(@alert, :location => alerts_url)
  end


  def destroy 
    @alert = Alert.find(params[:id])
    @alert.destroy
    respond_with(@alert, :location => alerts_url)
  end


end
