class ReservationsController < ApplicationController
  def index
    @bikes = Bike.where(seller: current_user)
    @reservations = Rental.all
    # @pending_reservations = current_user.reservations.where(status: "pending")
    # @reservations = current_user.rentals.group_by(&:status)
  end

  def show
    @reservation = Rental.find(params[:id])
    @bike = @reservation.bike
  end
end
