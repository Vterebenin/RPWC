Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  root 'resources#index'
  get 'home', to: 'static_pages#home'
  get 'cssrule', to: 'static_pages#cssrule'
  get 'static_pages/test'
  resources :resources
  devise_scope :admin do
		get '/admin' => 'devise/sessions#new'
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
