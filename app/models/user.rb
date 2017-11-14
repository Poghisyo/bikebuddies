class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :bikes, foreign_key: 'seller_id'
  has_many :rentals, foreign_key: 'buyer_id'
  has_many :reservations, through: :bikes, source: :rentals
end


