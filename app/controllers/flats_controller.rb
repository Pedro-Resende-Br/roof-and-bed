class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]

  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new  
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      #redirect_to dashboard_path
      redirect_to flats_index_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @flat.update(flat_params)
    redirect_to dashboard_path
  end

  def destroy
    @flat.destroy
    redirect_to dashboard_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :address, :city, :price, photos: [])
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
