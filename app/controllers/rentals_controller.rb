class RentalsController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @rental = Rental.find(params[:id])
    @garage = @rental.garage
  end

  def new
    @garage = Garage.find(params[:garage_id])
    @rental = Rental.new
    @rentals = @garage.next_bookings
    @rental_dates = @rentals.map do |rental|
      {
        from: rental.start_date,
        to: rental.end_date
      }
    end
    # @rental = Rental.new
    # @garage = Garage.find(params[:garage_id])
  end

  def create
    @rental = Rental.new(params_rental)
    @garage = Garage.find(params[:garage_id])
    @rental.user = current_user
    @rental.garage = @garage

    if @rental.save
      create_an_order
      redirect_to new_order_payment_path(@order)
    else
      render :new
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.delete
    redirect_to dashboard_path
  end

  private

  def params_rental
    params.require(:rental).permit(:start_date, :end_date)
  end

  def create_an_order
    @order = Order.create!(rental: @rental, amount: @garage.price_cents, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: @garage.location,
        images: [@garage.photo],
        amount: @garage.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    @order.update(checkout_session_id: session.id)
  end
end
