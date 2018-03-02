Rails.application.routes.draw do
  devise_for :consumers
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :personal_data, only: [:index]
    end
  end
end
