Rails.application.routes.draw do

  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # resources :category, only: [:show, :index] do
      resources :transactions, only: [ :index, :show, :create, :update, :destroy ]
      # end
    end
  end
end
