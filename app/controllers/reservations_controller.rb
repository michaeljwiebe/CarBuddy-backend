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
          render json: reservations_json
      end
  end

  def show
  end

  def update
  end

  def destroy
  end

  private

  def new_reservation_params
      params.require(:data).permit(:car_id, :start_time, :start_AMPM, :end_time, :end_AMPM)
  end
end
