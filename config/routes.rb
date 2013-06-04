Railsblog7::Application.routes.draw do
  devise_for :users do
    resources :comments, :only => [:index]
  end
  resources :posts do
	resources :comments, :only => [:index, :new, :create, :edit, :update]
  end
  
  get "home/index"
  match '/sessions' => 'sessions#create', as: :sessions
  match '/logout' => 'sessions#destroy', as: :logout

  root :to => 'home#index'
end
