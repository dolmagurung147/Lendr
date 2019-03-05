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
    payment = Payment.new(payment_params)
    debt = Debt.find(payment.debt_id)

    if debt.amount > 0 && payment.payment_amount <= debt.amount
      payment.make_payment(debt)
      payment.save
      debt.save
      redirect_to payment_path(payment)
    else
      flash[:errors] = "Payment invalid!"

      redirect_to new_payment_path
    end
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
