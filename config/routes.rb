Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  namespace :v1 do
    resources :users, only: %i[show update create destroy]

    namespace :users do
      resources :sessions, only: %i[create destroy]
    end
  end
end
