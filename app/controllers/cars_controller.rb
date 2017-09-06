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
# @kiana looks like i hadn't written this method yet :/ oops!
  def update_car_coordinates
    cars = Car.all
    car = cars.find(params[:id])
    car.update_attribute(:lat, params[:lat])
    car.update_attribute(:lng, params[:lng])
    if car.save!
      updated_cars = Car.all
      updated_cars_json = updated_cars.as_json
      render json: updated_cars_json
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
