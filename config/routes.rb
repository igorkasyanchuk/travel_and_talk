RailsjazzCom::Application.routes.draw do
  resource :user_session do 
    get 'logout'
  end
  resources :password_resets
  resources :users do
    resources :posts, :only => [:index, :show]
  end
  resources :companies, :only => [:show]
  
  namespace :admin do
    match '/', :to => 'dashboard#welcome'
    resources :users do
      member do
        get :toggle_admin
      end
    end
    resources :companies
    resources :company_categories
    resources :posts, :only => [:index, :destroy]
  end
  
  namespace :dashboard do
    match '/', :to => 'dashboard#welcome'
    resources :users, :only => [:edit, :update, :show] do
      resources :posts
      resources :companies do
        resources :locations
      end
    end
  end
  
  root :controller => 'home', :action => 'index'
  match "/sitemap.xml" , :controller => "sitemap", :action => "sitemap", :format => 'xml' 
end