class ChargesController < ApplicationController
  def new
    @checkout = Checkout.new
    @checkout.add_order_items_from_cart(current_order)
    @amount = current_order.subtotal + 8
    @description = "Order: #{current_order.id}"
    
  end


  
    # POST /checkouts
    # POST /checkouts.json
    def create
      @amount = (current_order.subtotal + 8).to_i
      
      @customer = Stripe::Customer.create({
        email: params[:stripeEmail],
        source: params[:stripeToken],
      })
      
      @charge = Stripe::Charge.create({
        customer: @customer.id,
        amount: @amount,
        description: 'Rails Stripe customer',
        currency: 'usd',
      })
      
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to root_path, notice: "Something goes wrong with payment"
      
      if charge.paid && charge.amount == amount
        @checkout = Checkout.create(@customer.email == @checkout.email )
        @checkout.add_order_items_from_cart(current_order)   
        if @checkout.save
          Order.destroy(session[:order_id])
          session[:order_id] = nil
          OrderMailer.order_recived(@checkout).deliver_now
        end
      end
  end
end
