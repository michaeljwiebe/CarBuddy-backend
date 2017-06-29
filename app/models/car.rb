class Car < ApplicationRecord
    has_many :users, through: :reservations
    has_many :ratings, through: :reviews

    has_many :reservations, dependent: :destroy
    has_many :reviews, dependent: :destroy

    has_attached_file :avatar,
    :storage => :s3,
    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

    def s3_credentials
      {:bucket => "carbuddy",
      :access_key_id => ENV["AWS_ACCESS_KEY_ID"],
      :secret_access_key => ENV["AWS_SECRET_ACCESS_KEY"],
      :s3_region => ENV["AWS_REGION"]}
    end
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
