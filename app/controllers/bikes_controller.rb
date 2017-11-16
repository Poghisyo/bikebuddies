class BikesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show]


  def index
    @filters = params.permit(:location)
    if @filters.present?
      @bikes = Bike.where("location ILIKE ?", "%#{@filters['location'].capitalize}%")
    else
      @bikes = Bike.all
    end

    # @bikes = Bike.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@bikes) do |bike, marker|
      marker.lat bike.latitude
      marker.lng bike.longitude
    end
      # marker.infowindow render_to_string(partial: "/bikes/map_box", locals: { bike: bike })

  end

  # def top
  #   Nice to implement a top price or top quality filter
  #   @bikes = Bike.where(price: XX)
  # end

  def show
    @bike = Bike.find(params[:id])





      @hash = Gmaps4rails.build_markers(@bike) do |bike, marker|
      marker.lat bike.latitude
      marker.lng bike.longitude
    end

  end



end
