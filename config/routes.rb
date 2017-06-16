Rails.application.routes.draw do

  get 'pages/home', to: "pages#home"
  get 'pages/about', to: 'pages#about' 
 
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'pages#home'

end
