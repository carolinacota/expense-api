class Api::V1::TransactionsController < Api::V1::BaseController
  before_action :set_transaction, only: [ :show, :update ]

  def index
    @transactions = policy_scope(Transaction)
  end

  def show
  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    @transaction.category = category
    authorize @transaction
    if @transaction.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
    authorize @transaction  # For Pundit
  end

  def transaction_params
    params.require(:transaction).permit(:paid_on, :currency, :value, :description)
  end

end
