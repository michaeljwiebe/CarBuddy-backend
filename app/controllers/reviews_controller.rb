class ReviewsController < ApplicationController
  def index
      reviews = Review.all
      reviews_json = reviews.as_json
      render json: reviews_json
  end

  def create
  end

  def show
  end

  def update
  end

  def destroy
  end
end
