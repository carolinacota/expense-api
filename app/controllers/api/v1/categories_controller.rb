class Api::V1::CategoriesController < Api::V1::BaseController
  def index
    @categories = policy_scope(Category)
  end
end
