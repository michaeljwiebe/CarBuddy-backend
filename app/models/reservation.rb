class Reservation < ApplicationRecord
    belongs_to :car

    def owner
        User.find(owner_id)
    end

    def renter
        User.find(renter_id)
    end
end
