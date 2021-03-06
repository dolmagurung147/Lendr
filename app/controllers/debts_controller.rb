class DebtsController < ApplicationController
  before_action :find_debt, only: %i[show edit update]

  def index
    @debts = Debt.all
    render :index
  end

  def show; end

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

  def edit; end

  def update
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

    def find_debt
      @debt = Debt.find(params[:id])
    end
end

