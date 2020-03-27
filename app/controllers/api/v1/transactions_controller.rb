class Api::V1::TransactionsController < Api::V1::BaseController
  before_action :set_transaction, only: [ :show, :update, :destroy ]
  # before_action :authenticate_user!

  def index
    month = (params[:month]).to_i.between?(1,12) ? params[:month] : Time.current.month

    @transactions = policy_scope(Transaction).by_month(month).order(paid_on: :desc)

    @transactions = @transactions.by_category(params[:category_id]) if params[:category_id].present?
    @categories = Category.all
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
    @transaction = Transaction.find(params[:id])
    authorize @transaction

    if @transaction.update(transaction_params)
      render :show #, status: :updated
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
    params.require(:transaction).permit(:paid_on, :currency, :price_cents, :price, :description, :category_id)
  end

  def render_error
    render json: { errors: @transactions.errors.full_messages },
      status: :unprocessable_entity #422
  end

end
