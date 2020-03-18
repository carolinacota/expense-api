Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  end


Rails.application.routes.draw do

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :categories, only: [ :index, :show]
      resources :transactions
    end
  end
end
