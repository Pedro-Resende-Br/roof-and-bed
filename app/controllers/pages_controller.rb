class PagesController < ApplicationController
  def home
  end

  def dashboard
    user = current_user
    @flats = Flat.where("user_id = #{user.id}").paginate(page: params[:page], per_page: 9)
    @bookings = Booking.where("user_id = #{user.id}").order(created_at: :desc)
  end
end
