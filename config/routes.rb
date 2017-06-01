Rails.application.routes.draw do
  root 'destinations#index'
  resources :destinations

  namespace :api, defaults: {format: :json}  do
    namespace :v1 do
      resources :destinations, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
