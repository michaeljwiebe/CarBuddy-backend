class Review < ApplicationRecord
    belongs_to :car

    def owner
        User.find(owner_id)
    end

    def reviewer
        User.find(reviewer_id)
    end
end
