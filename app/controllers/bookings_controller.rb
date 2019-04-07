class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def create
    @booking = vehicle.bookings.create!(user_id: current_user.id, price: 10, status: 'open')

    redirect_to bookings_path
  end

  def update
    @booking = current_user.bookings.find(params[:id])
    @booking.closed!

    redirect_back(fallback_location: root_path)
  end

  private

  def vehicle
    @vehicle ||= Vehicle.find(params[:vehicle_id])
  end
end