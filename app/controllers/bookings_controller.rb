class BookingsController < ApplicationController
  
  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.flat = Flat.find(params[:flat_id])
    #check_aviability(@booking)
    authorize @booking
    if @booking.save
      redirect_to root_path
    else
      new
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @booking.destroy
    redirect_to dashboard_path
  end

  private
  
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def check_avability(booking)
    # Return true or false if is avaiable, ideas: load all dates and compare if start_date and end date are < or > them all the groups [start_date, end_date] is avaiable
    #We can consult the query with the end date and start date, if it returns something is not avaiable
  end

end
