class CarsController < ApplicationController
  def index
      cars = Car.all
      cars_json = cars.as_json
    #   cars_json.each_with_index do |car, index|
    #       car[:owner] = cars[index].owner
    #       car[:renters] = cars[index]
    #       car[:reviews] = cars[index].reviews
    #   end
      render json: cars_json
  end

  def create
      new_car = Car.new(car_params)
      new_car[:owner_id] = 1
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

  def destroy
  end

  private

  def car_params
      params.require(:data).permit(:make_model, :year, :price, :owner_id, :lat, :lng, :mpg)
  end
end
