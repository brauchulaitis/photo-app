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
        :amount => 1000,
        :description => 'Description of your product',
        :currency => 'eur'
      })

      flash[:success] = 'Payment successful!'
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_payment_path
    end
  end
end
