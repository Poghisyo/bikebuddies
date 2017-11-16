class Bike < ApplicationRecord
  after_validation :geocode, if: :location_changed?

  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
  has_many :rentals

  mount_uploader :photo, PhotoUploader

  geocoded_by :location
end
