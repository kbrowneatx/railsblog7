Railsblog7::Application.routes.draw do
  devise_for :users 
  resources :users, :only => [:index, :show] do
    resources :comments, :only => [:index]
  end
  resources :posts do
	resources :comments, :only => [:index, :new, :create]
  end

  root :to => 'home#index'
end
