class PaymentsController < ApplicationController


  def show
    @payment = Payment.find(params[:id])
  end

  def new
    @payment = Payment.new

    if params[:debt_id]
      @debt = Debt.find(params[:debt_id])
    else
      @debt = Debt.find(flash[:debt_id])
    end

  end

  def create
    payment = Payment.new(payment_params)
    debt = Debt.find(payment.debt_id)
    # debt is used for validations

    debt_validation(debt, payment)
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy

    redirect_to user_path(current_user)
  end

  private

  def payment_params
    params.require(:payment).permit(:user_id, :debt_id, :payment_amount, :comment)
  end

  def debt_validation(debt, payment)
    if(payment.payment_amount && debt.amount > 0 && payment.payment_amount <= debt.amount)
      payment.make_payment(debt)
      payment.save
      debt.save
      redirect_to payment_path(payment)
    else
      flash[:errors] = "Payment invalid!"
      flash[:debt_id] = debt.id
      redirect_to new_payment_path
    end
  end

end
