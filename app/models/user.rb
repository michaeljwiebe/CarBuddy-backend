class User < ApplicationRecord
    has_many :cars, through: :reservations
    has_many :ratings, through: :reviews

    has_many :reservations
    has_many :reviews

    has_attached_file :avatar
    validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    # has_attached_file :avatar, :avatar_url => "/avatars/original/missing.png"
    # validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
