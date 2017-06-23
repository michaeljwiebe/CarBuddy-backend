class ReservationsController < ApplicationController
  def index
      reservations = Reservation.all
      reservations_json = reservations.as_json
      render json: reservations_json
  end

  def create
      new_reservation = Reservation.new(new_reservation_params)
      if new_reservation.save!
          reservations = Reservation.all
          reservations_json = reservations.as_json
        #   reservations_json.each_with_index do |reservation, index|
        #       reservation[:car] = reservations[index].cars
        #   end
          render json: reservations_json
      end
  end

  def show
  end

  def update
  end

  def destroy
      Reservation.find(params[:id]).destroy
      reservations = Reservation.all
      reservations_json = reservations.as_json
      render json: reservations_json
  end

  private

  def new_reservation_params
      params.require(:data).permit(:car_id, :renter_id, :start_date, :end_date, :reservation_hours)
  end
end
