class OrdersController < ApplicationController
   def create
    #  @order = current_user.orders.where(state: 'pending').find(params[:order_id])
    #  @rental = Rental.find(@order.rental_id)
    #  @price_unitaire = @rental.total_price

    # order = Order.create!(garage: rental.garage, amount: @price_unitaire, state: 'pending', user: current_user)

    # session = Stripe::Checkout::Session.create(
    #   payment_method_types: ['card'],
    #   line_items: [{
    #     name: garage.location,
    #     images: [garage.photo],
    #     amount: @price_unitaire,
    #     currency: 'eur',
    #     quantity: 1
    #   }],
    #   success_url: order_url(order),
    #   cancel_url: order_url(order)
    # )
    # order.update(checkout_session_id: session.id)
    # redirect_to new_order_payment_path(order)

  end

  def show
    @order = current_user.orders.find(params[:id])
    # @order = current_user.orders.where(state: 'pending').find(params[:order_id])
     @rental = Rental.find(@order.rental_id)
     @price_unitaire = @rental.total_price
  end
end
