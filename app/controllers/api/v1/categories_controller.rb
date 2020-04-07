class Api::V1::CategoriesController < Api::V1::BaseController
  before_action :authenticate_user!
  skip_after_action :verify_authorized, only: :index

  def index
    @categories = policy_scope(Category).all
  end

  def category_per_month
    @month = (params[:month]).to_i.between?(1,12) ? params[:month] : Time.current.month

    @total = policy_scope(Transaction).total_in_month(@month)
    @categories = policy_scope(Category).includes(:transactions)
                                        .order(name: :asc)
    authorize @categories
  end
end
