class CarsController < ApplicationController
  def index
      cars = Car.all
      cars_json = cars.as_json
      cars_json.each_with_index do |car, index|
          car[:reviews] = cars[index].reviews
          car[:reservations] = cars[index].reservations
          car[:avatar_url] = cars[index].avatar.url
      end
      render json: cars_json
  end

  def create
      new_car = Car.new(new_car_params)
      if new_car.save!
          cars = Car.all
          cars_json = cars.as_json
          cars_json.each_with_index do |car, index|
              car[:reviews] = cars[index].reviews
              car[:reservations] = cars[index].reservations
              car[:avatar_url] = cars[index].avatar.url
          end
          render json: cars_json
      end
  end

  def upload_image
    car = Car.last
    car.update_attribute(:avatar, params[:data])
    render json: {avatar_url: car.avatar.url}
  end

  def update_car_coordinates
    # lat and lng here are nil, why? id seems to be working. heroku run rails c did not p params to my console
    p params
    updated_car = Car.find(params[:id])
    updated_car.lat = params[:lat]
    updated_car.lng = params[:lng]
    if updated_car.save!
        all_cars = Car.all
        all_cars_json = all_cars.as_json
        render json: all_cars_json
    end
  end

  def destroy
      Car.find(params[:id]).destroy
      cars = Car.all
      cars_json = cars.as_json
      cars_json.each_with_index do |car, index|
          car[:reviews] = cars[index].reviews
          car[:reservations] = cars[index].reservations
          car[:avatar_url] = cars[index].avatar.url
      end
      render json: cars_json
  end

  private

  def new_car_params
      params.require(:data).permit(:make_model, :year, :price, :owner_id, :lat, :lng, :mpg)
  end
end
