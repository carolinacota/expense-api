Rails.application.routes.draw do

  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      # devise_for :users, only: :create, :controllers => {sessions: 'sessions', registrations: 'registrations'}
      devise_scope :user do
        post "sign_up", to: "registrations#create"
        post "sign_in", to: "sessions#create"
      end
      # resources :category, only: [:show, :index] do
      resources :transactions, only: [ :index, :show, :create, :update, :destroy ]
      # end
    end
  end
end
