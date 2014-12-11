Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  resources :pages do
  	resources :comments
  end

end
