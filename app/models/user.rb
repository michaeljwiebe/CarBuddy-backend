class User < ApplicationRecord
    has_many :cars, through: :reservations
    has_many :ratings, through: :reviews

    has_many :reservations
    has_many :reviews
end
