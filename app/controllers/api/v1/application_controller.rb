class Api::V1::TransactionsController < Api::V1::BaseController
  before_action :authenticate_user!
  acts_as_token_authentication_handler_for User
end
