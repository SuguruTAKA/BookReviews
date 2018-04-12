Rails.application.routes.draw do
  resources :reviews, only: [:index, :destroy]
  root 'books#index'
  resources :books do
  	resources :reviews, except: [:index, :destroy]
  end
  devise_for :users
  get 'my_books', to: 'books#my_books'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
