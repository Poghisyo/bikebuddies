class ReservationsController < ApplicationController
  def index
    # @reservations = current_user.reservations
    @pending_reservations = current_user.reservations.where(status: "pending")
  end

  # def show
  #   @reservation = Rental.find(params[:id])
  # end
end
