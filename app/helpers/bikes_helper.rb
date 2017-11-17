module BikesHelper
  def bike_picture_url(bike)
    if bike.photo.url.nil?
      return image_path("bycicle.jpg")
    else
      return cl_image_path(bike.photo, height: 300, width: 400, crop: :fill, class: "bike-image")
    end
  end
end
