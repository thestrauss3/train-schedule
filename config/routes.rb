Rails.application.routes.draw do
  root "static_pages#home"
  get '/home', to: 'static_pages#home'
  get '/sign_on', to: 'static_pages#sign_on'
  get '/about', to: 'static_pages#about_us'

  resources :routes, only: [:index, :show]
  resources :trains, only: [:show]
  resources :users, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :routes, only: [:index, :show] do
        resources :trains, only: [:index]
        resources :stations, only: [:index]
      end

      resources :stations, only: [] do
        resources :trains, only: [] do
          resources :train_stops, only: [:index]
        end
      end

      resources :users, only: [:index, :show] do
        resources :trains, only: []
        resources :stations, only: []
        resources :routes, only: []
        collection do
          get 'current_user_id'
          get 'toggle_favorite_route'
          get 'toggle_favorite_train'
          get 'toggle_favorite_station'
        end
      end
    end
  end

  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
  get '*path', to: 'static_pages#error'
end
