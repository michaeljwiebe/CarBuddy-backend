class User < ApplicationRecord
    has_many :cars, through: :reservations
    has_many :ratings, through: :reviews

    has_many :reservations
    has_many :reviews

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
end
