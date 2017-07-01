Rails.application.routes.draw do
  get 'welcome/index'
	root :to => "welcome#index"
	
  	resources :articles do
  		resources :comments, only: [:show, :index]
	end
end