class Car < ApplicationRecord
    has_many :users, through: :reservations
    has_many :ratings, through: :reviews

    has_many :reservations, dependent: :destroy
    has_many :reviews, dependent: :destroy

    has_attached_file :avatar
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

    def owner
        User.find(owner_id)
    end

    def renter
        User.find(renter_id)
    end

    def reviewer
        User.find(reviewer_id)
    end



end
