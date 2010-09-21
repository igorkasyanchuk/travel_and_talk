RailsjazzCom::Application.routes.draw do
  resource :user_session do 
    get 'logout'
  end
  resources :password_resets
  resources :users
  
  namespace :admin do
    match '/', :to => 'dashboard#welcome'
    resources :users
    resources :companies
  end
  
  namespace :dashboard do
    match '/', :to => 'dashboard#welcome'
  end
  
  root :controller => 'home', :action => 'index'
  match "/sitemap.xml" , :controller => "sitemap", :action => "sitemap", :format => 'xml' 
end