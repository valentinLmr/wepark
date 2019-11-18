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

    if @rental.save
      redirect_to garage_rental_path
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
