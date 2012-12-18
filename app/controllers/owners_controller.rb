class OwnersController < ApplicationController
  respond_to :xml, :json
    
  def index 
    @owners = Owner.all
    respond_with(@owners)
  end
  def show
    @owner = Owner.find_or_create(params[:id])
    respond_with(@owner)
  end
  
  def create
    @owner = Owner.create(params[:owner])
    respond_with(@owner, :location => owners_path)
  end
  
end
