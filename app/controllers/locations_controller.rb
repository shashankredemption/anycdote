class LocationsController < ApplicationController 
  def new
  end
  
  def index
    @locations = Location.all
  end
  
  def show
    loc = Location.find(params[:id])
    @anycdotes = Anycdote.where(location: loc.location)
    p loc.location
  end
  
  def create
  end
end