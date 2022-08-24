class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @cat = Cat.find(params[:cat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @cat = Cat.find(params[:cat_id])
    @booking.cat = @cat
    @booking.user = current_user
    @booking.status = 1
    @booking.save
    flash.alert = "Booking Succesfull :)"
    redirect_to cat_path(@cat)
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
