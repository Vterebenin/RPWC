Rails.application.routes.draw do
  resources :categories
  devise_for :admins
  root 'static_pages#home'
  get 'cssrule', to: 'static_pages#cssrule'
  get 'static_pages/test'
  resources :resources
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
