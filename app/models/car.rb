class Car < ApplicationRecord
    has_many :users, through: :reservations
    has_many :ratings, through: :reviews

    has_many :reservations
    has_many :reviews

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
