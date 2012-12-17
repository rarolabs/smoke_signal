# encoding: UTF-8

class AlertsController < ApplicationController

  respond_to :xml, :json
  def index
    respond_with(@alerts = Alert.all)
  end
  
  def create
    @alert = Alert.create(params[:alert])
    respond_with(@alert, :location => alerts_url)
  end
  
  def update 
    @alert = Alert.find(params[:id])
    @alert.update_attributes(params[:alert])
    respond_with(@alert, :location => alerts_url)
  end

end
