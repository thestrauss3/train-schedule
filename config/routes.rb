Rails.application.routes.draw do
  root 'static_pages#home'

  resources :train_lines, only: [:index, :show]
  resources :trains, only: [:show]

  get '*path' => 'static_pages#error'
end
