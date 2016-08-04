Rails.application.routes.draw do
  resources :designers, only: [:new, :create]
  resources :jobs
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root to: "jobs#index"
end
