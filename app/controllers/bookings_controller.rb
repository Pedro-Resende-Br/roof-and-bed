class BookingsController < ApplicationController
  
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = Flat.find(params[:id])
    if @booking.save
      redirect_to dashboard_path(@flat)
    else
      render :new
    end
  end

  private
  
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
