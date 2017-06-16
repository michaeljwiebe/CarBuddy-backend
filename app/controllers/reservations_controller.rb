class ReservationsController < ApplicationController
  def index
      reservations = Reservation.all
      reservations_json = reservations.as_json
      render json: reservations_json
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
