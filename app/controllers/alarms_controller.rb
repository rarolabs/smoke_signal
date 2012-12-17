# encoding: UTF-8

class AlarmsController < ApplicationController

  def index
    @collection = Alarm.where(:ownser => params[:owner])
  end
  
  def create
    @alarm = Alarm.new(params[:alarm])
    if @alarm.save
      render :action => :show
    else
     flash[:error] = "Unable to create a new alarm"
     render :action => :error
    end
  end
  
  def update
    @alarm = Alarm.update_attributes(params[:alarm])
    if @alarm.save
      render :action => :show
    else
      flash[:error] = "Unable to update this alarm"
      render :action => :error
    end
  end
  
  def show 
    @alarm = Alarm.find(params[:id])
  end
  
  def destroy
    @alarm = Alarm.find(params[:id])
    if @alarm.destroy
      redirect_to alarms_path
    else
      flash[:error] = "Unable to destroy this alarm"
      render :action => :error
    end
  end

end
