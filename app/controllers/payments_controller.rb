class PaymentsController < ApplicationController

  def index
    @payments = Payment.all

  end

  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new

  end

  def create
    payment = Payment.create(payment_params)

    redirect_to payment_path(payment)
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy

    redirect_to payments_path
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :debt_id, :payment_amount, :comment)
  end
end

# Payment(index, show, new, create, delete)
