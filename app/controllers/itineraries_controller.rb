class ItinerariesController < ApplicationController
  def index
    @itineraries = Itinerary.all
  end

  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)

    if @itinerary.save
      redirect_to new_itinerary_visit_path(@itinerary)
      flash[:notice] = "Itinerary has been successfuly created"
    else
      redirect_to new_itinerary_path
      flash[:alert] = "Itinerary has not been created"
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])

    if @itinerary.destroy
      redirect_to itineraries_path
      flash[:notice] = "Itinerary has been successfuly destroyed"
    else
      redirect_to itineraries_path
      flash[:alert] = "Itinerary has been successfuly destroyed"
    end
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:destination_latitude, :destination_longitude, :start_time)
  end
end