class RentalsController < ApplicationController
  def new
    @bike = Bike.find(params[:id])
  end
end
