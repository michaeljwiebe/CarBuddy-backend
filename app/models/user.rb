class User < ApplicationRecord
    has_many :cars, through: :reservations
    has_many :ratings, through: :reviews

    has_many :reservations
    has_many :reviews

    has_attached_file :image
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
