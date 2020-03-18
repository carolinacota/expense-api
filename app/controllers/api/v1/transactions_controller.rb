class Api::V1::TransactionsController < Api::V1::BaseController
  def index
    @transactions = policy_scope(Transaction)
  end
end
