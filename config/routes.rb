Rails.application.routes.draw do
  root 'static_pages#home'

  resources :train_lines, only: [:index, :show]
  resources :trains, only: [:show]

  namespace :api do
    namespace :v1 do
      resources :train_lines, only: [:index, :show] do
        resources :trains
        resources :stations
      end
    end
  end

  get '*path' => 'static_pages#error'
end
