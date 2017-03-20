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
      redirect_to new_itinerary_visit_path(@itinerary), notice: 'ok'
    else
      flash[:error] = 'Itinerary has not been created'
      redirect_to new_itinerary_path, notice: 'failure'
    end
  end

  def show
    @itinerary = Itinerary.find(params[:id])
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(:destination_latitude, :destination_longitude, :start_time)
  end
end