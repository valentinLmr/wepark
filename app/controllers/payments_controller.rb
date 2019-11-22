class PaymentsController < ApplicationController
  def new
    @order              = current_user.orders.where(state: 'pending').find(params[:order_id])
    @rental             = Rental.find(@order.rental_id)
    @price_unitaire     = @rental.total_price
    @order.amount_cents = @price_unitaire
  end
end
