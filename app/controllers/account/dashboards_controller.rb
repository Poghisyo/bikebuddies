class Account::DashboardsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @bike = Bike.new
    @bikes = Bike.where(seller: current_user)
    @rentals = Rental.where(buyer_id: current_user)
    @use_name = current_user.name ? current_user.name : current_user.email
  end

end
