class Account::BikesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bikes = Bike.all
  end

  def new
    @bike = Bike.new
    @use_name = current_user.name ? current_user.name : current_user.email
  end
end
