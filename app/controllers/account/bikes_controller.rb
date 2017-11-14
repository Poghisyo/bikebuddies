class Account::BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
    @bike.seller = current_user
  end
end
