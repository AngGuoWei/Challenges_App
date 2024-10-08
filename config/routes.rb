Rails.application.routes.draw do
  devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
  } 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  # get "up" => "rails/health#show", as: :rails_health_check

  # /api/v1/challenges
  # /api/v2/challenges
  # /api/v1/challenges/:id
  namespace :api do
    namespace :v1 do
      resources :challenges
    end
    # can insert namespace :v2 here if there is any version upgrades
  end
  # Defines the root path route ("/")
  # root "posts#index"
end
