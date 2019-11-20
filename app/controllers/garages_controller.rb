class GaragesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    # @garages = Garage.all
    @garages = policy_scope(Garage)
    @garages = Garage.search(params[:search])
    @list
  end

  def new
    @garage = Garage.new
    authorize(@garage)
  end

  def create
    @garage = Garage.new(garage_params)
    @garage.user = current_user
    authorize(@garage)

    if @garage.save
      redirect_to garages_path
    else
      render :new
    end
  end

  def show
    @garage = Garage.find(params[:id])
    authorize(@garage)
  end

  def edit
    @garage = Garage.find(params[:id])
  end

  def update
    @garage = Garage.find(params[:id])
    if @garage.update(garage_params)
      redirect_to garage_path
    else
      render :edit
    end
  end

  def destroy
    @garage = Garage.find(params[:id])
    @garage.delete

    redirect_to dashboard_path
  end

  private

  def garage_params
    params.require(:garage).permit(:capacity, :price, :description, :location, :photo, :search)
  end
end
