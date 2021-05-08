class PagesController < ApplicationController
  def home
  end

  def dashboard
    user = current_user
    @flats = Flat.where("user_id = #{user.id}")
    @bookings = Booking.where("user_id = #{user.id}")
  end
end
