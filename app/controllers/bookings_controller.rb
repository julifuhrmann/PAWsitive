class BookingsController < ApplicationController
  before_action :set_booking, only: %i[update destroy]
  before_action :set_user_and_cat, only: %i[index destroy]

  def index
    @bookings = Booking.all
  end

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
    if @booking.valid?
      @booking.save
      redirect_to bookings_path, notice: "Booking Succesfull :)"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path(@user), status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_user_and_cat
    @user = current_user
  end

  def booking_params
    params.require(:booking).permit(:status, :start_date, :end_date)
  end
end
