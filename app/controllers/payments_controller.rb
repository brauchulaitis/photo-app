class PaymentsController < ApplicationController
  def new
  end

  def index
  end

  def create
    begin
      customer = Stripe::Customer.create({
        :email => params[:stripeEmail],
        :source => params[:stripeToken]
      })

      charge = Stripe::Charge.create({
        :customer => customer.id,
        :amount => 500,
        :description => 'Description of your product',
        :currency => 'usd'
      })

      flash[:success] = 'Payment successful!'
      # Redirect or show a success page after successful payment
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
      # Redirect or show an error page if there's an issue with the payment
    end
  end
end
