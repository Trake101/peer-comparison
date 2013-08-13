PeerComparison::Application.routes.draw do
  root :to => 'home#index'
  resources :comparisons

  #static resource links
  match 'contact', :to => 'home#contact'
  match 'about', :to => 'home#about'
  match 'faq', :to => 'home#faq'
  match 'methodology', :to => 'home#methodology'
  match 'usage', :to => 'home#usage'  
end
