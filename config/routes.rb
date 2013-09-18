PeerComparison::Application.routes.draw do
  root :to => 'home#index'
  resources :comparisons
  resources :institutions

  #static resource links
  match 'contact', :to => 'home#contact'
  match 'about', :to => 'home#about'
  match 'faq', :to => 'home#faq'
  match 'methodology', :to => 'home#methodology'
  match 'usage', :to => 'home#usage'

	#api links
	namespace :api, defaults: {format: 'json'} do
		namespace :v1 do
			resources :comparisons
		end
	end
  
end
