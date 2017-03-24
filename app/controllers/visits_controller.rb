class VisitsController < ApplicationController
  before_action :set_visit, except: [:new, :create]
  before_action :set_itinerary

  def new
    @visit = @itinerary.visits.new
    @visits = @itinerary.visits.order(:id)
  end

  def create
    @visit = @itinerary.visits.new(visit_params)

    if @visit.save
      ArrivalTimeService.new(@visit).call
      redirect_to new_itinerary_visit_path
      flash[:notice] = "Visit has been successfuly created"
    else
      redirect_to new_itinerary_visit_path
      flash[:alert] = "Visit has not been created"
    end
  end

  def show
  end
  
  def edit
  end

  def update
    if @visit.update(visit_params)
      redirect_to new_itinerary_visit_path
    end
  end

  def destroy
    if @visit.destroy
      redirect_to new_itinerary_visit_path
    end
  end

  private

  def set_visit
    @visit = Visit.find(params[:id])
  end

  def set_itinerary
    @itinerary = Itinerary.find(params[:itinerary_id])
  end

  def visit_params
    params.require(:visit).permit(:address, :latitude, :longitude, :duration, :arrival_time)
  end
end
