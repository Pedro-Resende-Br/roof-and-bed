class FlatsController < ApplicationController
  before_action :set_flat, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:query].present?
      @flats = policy_scope(Flat.search_by_title_address_and_description(params[:query])).order(created_at: :desc)
    else
      @flats = policy_scope(Flat).order(created_at: :desc)
    end
  end
  
  def show
    @flat = Flat.find(params[:id])
    @markers = [{lat: @flat.latitude, lng: @flat.longitude}]
    authorize @flat
  end

  def new
    @flat = Flat.new
    authorize @flat  
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    authorize @flat 
    if @flat.save
      redirect_to dashboard_path 
      #redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @flat = Flat.find(params[:id]) 
    authorize @flat 
  end

  def update
    @flat.update(flat_params)
    authorize @flat 
    redirect_to dashboard_path
  end

  def destroy
    @flat.destroy
    authorize @flat
    redirect_to dashboard_path
  end

  private

  def flat_params
    params.require(:flat).permit(:title, :description, :address, :price, :photo)
  end

  def set_flat
    @flat = Flat.find(params[:id])
  end
end
