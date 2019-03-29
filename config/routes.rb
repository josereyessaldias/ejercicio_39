Rails.application.routes.draw do

  get 'pages/dashboard'
  patch 'pages/change/:id', to: 'pages#change', as: 'change'
  delete 'pages/erase/:id', to:'pages#erase_user', as: 'erase'

	resources :posts do
		resources :comments, only: [:create, :destroy]
	end

	devise_for :users, controllers: {
		sessions: 'users/sessions',
		registrations: 'users/registrations'
	}

	root 'posts#index'
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
