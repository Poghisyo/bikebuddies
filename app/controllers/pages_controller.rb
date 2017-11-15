class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
    @bikes = Bike.all
    @three_bikes = @bikes.take(3)
  end
end
