Rails.application.routes.draw do
	get 'welcome/index'

	get 'signup', :to => 'users#new'
	post 'signup', :to => 'users#create'
	get 'login', :to => 'sessions#login'
	post 'login', :to => 'sessions#login_attempt'
	get 'logout', :to => 'sessions#logout'
	get 'home', :to => 'sessions#home'
	get 'profile', :to => 'sessions#profile'
	get 'setting', :to => 'sessions#setting'

	resources :articles do
		resources :comments
	end

	root :to => 'sessions#login'
end