require_relative '../monads/bookings'

class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index; end

  def show
    @booking = current_user.bookings.find(params[:id])
  end

  def new
    @vehicle = Vehicle.find(params[:vehicle_id])
  end

  def create
    result = ::Bookings::Create::Action.new.call(
      current_user, params: params
    )

    if result.success?
      @booking = result.value!
      redirect_to bookings_path
    else
      render :new
    end
  end

  def update
    @booking = current_user.bookings.find(params[:id].to_i)
    @booking.closed!

    redirect_back(fallback_location: root_path)
  end

  private

  def vehicle
    @vehicle ||= Vehicle.find(params[:vehicle_id])
  end
end