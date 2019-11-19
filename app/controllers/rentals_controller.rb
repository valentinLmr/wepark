class RentalsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(params_rental)
    @rental.user = current_user
    @rental.garage = Garage.find(params[:garage_id])

    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
  end

  private

  def params_rental
    params.require(:rental).permit(:start_date, :end_date)
  end
end
