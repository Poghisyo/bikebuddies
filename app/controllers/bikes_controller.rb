class BikesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @filters = params.permit(:location)

    if @filters.present?
      @bikes = Bike.where(@filters)
    else
      @bikes = Bike.all
    end
  end

  # def top
  #   Nice to implement a top price or top quality filter
  #   @bikes = Bike.where(price: XX)
  # end

  def show
    @bike = Bike.find(params[:id])
  end
end
