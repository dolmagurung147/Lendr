class DebtsController < ApplicationController

  def index
    @debts = Debt.all
    render :index
  end

  def show
    @debt = Debt.find(params[:id])
    render :show
  end

  def new
    @debt = Debt.new
  end

  def create
    debt = Debt.new(debt_params)
    debt.user_id = current_user.id
    debt.save
    if debt.valid? #validation
      redirect_to debt_path(debt)
    else
      flash[:errors] = debt.errors.full_messages
      redirect_to new_debt_path
    end
  end

  def edit
    @debt = Debt.find(params[:id])
  end

  def update
    @debt = Debt.find(params[:id])
    @debt.update(debt_params)
    redirect_to debt_path(@debt)
  end

  def destroy
    @debt = Debt.find(params[:id])
    @debt.destroy
    redirect_to debts_path
  end

  private
    def debt_params
      params.require(:debt).permit(:user_id, :category_id, :amount, :story, :due_date, :payback, :title)
    end
end
