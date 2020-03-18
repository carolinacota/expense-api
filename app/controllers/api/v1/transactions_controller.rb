class Api::V1::TransactionsController < Api::V1::BaseController
  before_action :set_transaction, only: [ :show ]

  def show
  end

  def index
    @transactions = policy_scope(Transaction)
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
    authorize @transaction  # For Pundit
  end
end
