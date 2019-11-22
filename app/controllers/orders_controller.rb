class OrdersController < ApplicationController
  def create
    garage = Rental.find(params[:rental_id])
    # price = prix unitaire fois nombre de jours
    order = Order.create!(garage: rental.garage, amount: rental.garage.price_cents, state: 'pending', user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: garage.location,
        images: [garage.photo],
        amount: garage.price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(order)
  end

  def show
    @order = current_user.orders.find(params[:id])
  end
end
