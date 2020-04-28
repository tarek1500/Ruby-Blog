Rails.application.routes.draw do
	get 'welcome/index'

	post 'authenticate', to: 'authentication#authenticate'

	resources :articles do
		resources :comments
	end

	root 'welcome#index'
end