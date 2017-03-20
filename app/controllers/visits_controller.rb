class VisitsController < ApplicationController
  def new
    @itinerary = Itinerary.find(params[:itinerary_id])
    @visit = @itinerary.visits.new

    @visits = @itinerary.visits.order(:id) unless @itinerary.visits.empty?
  end

  def create
    @itinerary = Itinerary.find(params[:itinerary_id])
    @visit = @itinerary.visits.new(visit_params)

    if @visit.save
      redirect_to new_itinerary_visit_path
    end
  end

  def show
    @visit = Visit.find(params[:id])
  end
  
  def edit
    @visit = Visit.find(params[:id])
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def update
    @visit = Visit.find(params[:id])

    if @visit.update(visit_params)
      redirect_to new_itinerary_visit_path
    end
  end

  def destroy
    @visit = Visit.find(params[:id])
    if @visit.destroy
      redirect_to new_itinerary_visit_path
    end
  end

  private

  def visit_params
    params.require(:visit).permit(:address, :duration, :arrival_time)
  end
end
