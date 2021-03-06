class ReviewsController < ApplicationController
  def index
      reviews = Review.all
      reviews_json = reviews.as_json
      reviews_json.each_with_index do |review, index|
          review[:reviewer] = User.find(reviews[index].reviewer_id)
      end
      render json: reviews_json
  end

  def create
      new_review = Review.new(new_review_params)
      if new_review.save!
          reviews = Review.all
          reviews_json = reviews.as_json
          reviews_json.each_with_index do |review, index|
              review[:reviewer] = User.find(reviews[index].reviewer_id)
          end
          render json: reviews_json
      end
  end

  def show
  end

  def update
      edited_review = Review.find(params[:id])
      edited_review.title = params[:title]
      edited_review.description = params[:description]
      edited_review.rating = params[:rating]
      if edited_review.save!
          reviews = Review.all
          reviews_json = reviews.as_json
          reviews_json.each_with_index do |review, index|
              review[:reviewer] = User.find(reviews[index].reviewer_id)
          end
          render json: reviews_json
      end
  end

  def destroy
  end

  private

  def new_review_params
      params.require(:data).permit(:car_id, :title, :description, :rating, :reviewer_id)
  end
end
