Rails.application.routes.draw do
  
  root to: 'route_searches#suggest_route'
  devise_for :users
  resources :users

  resources :route_searches do 
    collection do
      post 'suggest_route'
      put 'best_route'
    end
  end  

  resources :ge_city_apis do
    collection do 
      get 'live_feed'
    end
  end

end
