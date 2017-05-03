Rails.application.routes.draw do
  root 'static_pages#home'
  get '/home', to: 'static_pages#home'
  get '/sign_on', to: 'static_pages#sign_on'
  resources :train_lines, only: [:index, :show]
  resources :trains, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :train_lines, only: [:index, :show] do
        resources :trains, only: [:index]
        resources :stations, only: [:index]
      end

      resources :stations, only: [] do
        resources :trains, only: [] do
          resources :train_stops, only: [:index]
        end
      end
      # get `/stations/#{:station_id}/trains/#{:train_id}/train_stops` =>  :train_stops

      # resources :train_stops, only: [:index] do
      #   resources :stations, only: [] do
      #     resources :trains, only: []
      #   end
      # end
    end
  end
  get '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: "sessions#destroy"
  get '*path' => 'static_pages#error'
end
