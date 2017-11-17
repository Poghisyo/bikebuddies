class RentalsController < ApplicationController
  def new
    @bike = Bike.find(params[:bike_id])
    @params = params
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)

    days = (@rental.end_date - @rental.start_date).to_i
    bike = Bike.find(params[:bike_id])
    bike_price = bike.price
    total_price = days * bike_price
    @rental.total_price = total_price
    @rental.buyer = current_user
    @rental.bike = bike
    @rental.save!
    # raise
    redirect_to rentals_path
  end

  def index
    @rentals = Rental.where(buyer_id: current_user)
    redirect_to account_dashboards_path(active: "rentals")
  end

  private

  def rental_params
    params.require(:rental).permit(:start_time, :start_date, :end_time, :end_date, :bike_id)

  end
end
