class Account::BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bikes = Bike.where(seller: current_user)
    @use_name = current_user.name ? current_user.name : current_user.email
  end

  def new
    @bike = Bike.new
    @use_name = current_user.name ? current_user.name : current_user.email
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.seller = current_user
    # binding.pry
    @bike.save!
    redirect_to account_bikes_path
  end

  def show
    @bike = Bike.find(params[:id])
  end


  private

  def bike_params
    params.require(:bike).permit(:name, :price, :location, :condition, :availability, :description, :seller, :photo, :photo_cache)
  end
end
