class CarsController < ApplicationController
  def index
      cars = Car.all
      cars_json = cars.as_json
      cars_json.each_with_index do |car, index|
          car[:reviews] = cars[index].reviews
          car[:reservations] = cars[index].reservations
      end
      render json: cars_json
  end

  def create
      new_car = Car.new(new_car_params)
      if new_car.save!
        cars = Car.all
        cars_json = cars.as_json
        render json: cars_json
      end
  end

  def show
  end

  def update
  end

  def upload_image
    car = Car.last
    car.update_attribute(:avatar, params[:data])
    render json: car
  end

  def destroy
      Car.find(params[:id]).destroy
      cars = Car.all
      cars_json = cars.as_json
      render json: cars_json
  end

  private

  def new_car_params
      params.require(:data).permit(:make_model, :year, :price, :owner_id, :lat, :lng, :mpg)
  end
end