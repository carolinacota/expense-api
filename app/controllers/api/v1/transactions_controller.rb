class Api::V1::TransactionsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_transaction, only: [ :show, :update, :destroy ]
  # before_action :authenticate_user!

  def index
    @transactions = policy_scope(Transaction)

  end

  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.user = current_user
    authorize @transaction
    # @transaction.category = category
    if @transaction.save
      render :show, status: :created
    else
      render_error
    end
  end

  def show
    #
  end

  def update
    if @transaction.update(transaction_params)
      render :show, status: :updated
    else
      render_error
    end
  end

  def destroy
    @transaction.destroy
    head :no_content
  end

  private

  def set_transaction
    @transaction = Transaction.find(params[:id])
    authorize @transaction  # For Pundit
  end

  def transaction_params
    params.require(:transaction).permit(:paid_on, :currency, :value, :description, :category_id)
  end

  def render_error
    render json: { errors: @transactions.errors.full_messages },
      status: :unprocessable_entity #422
  end

end
