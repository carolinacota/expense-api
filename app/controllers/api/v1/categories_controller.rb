class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    @month = (params[:month]).to_i.between?(1,12) ? params[:month] : Time.current.month

    @total = Transaction.total_in_month(@month)
    @categories = policy_scope(Category).includes(:transactions)
                                        .order(name: :asc)
  end
end
