LetsFish::Application.routes.draw do
  devise_for :users

  as :user do
    get 'users/edit', :to => 'devise/registrations#edit', :as => :user_root
  end

  #api
  namespace :api do
    scope module: :v1 do
      post '/water/fishery/:slug', to: 'waters#create'
    end
  end


  namespace :admin do
    resources :trips do
      resources :posts
    end
    resources :water_types
    resources :species
      resources :fisheries do
        resources :waters
      end
  end

  get '/fisheries',  to: 'browse_fisheries#index'

  get '/your/fishery', to: 'admin/fisheries#index'

  resources :fisheries do
    resources :waters
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#index'
  get 'search/within-bounding-box', to: 'search#within_bounding_box'
  get 'search/waters', to: 'search#waters'
  get 'search/suggested', to: 'search#suggested'
  get '/waters',  to: 'browse_waters#index'
  get '/destinations',  to: 'browse_destinations#index'
  get '/sitemaps',        to: 'sitemaps#index'

  get '/contributors',        to: 'contributors#index'
  get '/how-it-works',        to: 'how_it_works#index'
  get '/donate',  to: 'donate#index'

  get '/trip/:id', to: 'static#index'
  
  resources :trips do
    resources :posts
  end

  get '/featured/waters',  to: 'featured_waters#index'

  get '/search',  to: 'search#index'
  get '/weather', to: 'weather#forecast'

  get 'suggested/all', to: 'suggested#all'
  get 'suggested/waters', to: 'suggested#waters'
  get 'suggested/fisheries', to: 'suggested#fisheries'

  get '/login', to: 'admin/fisheries#index'

  get '/image/attribution', to: 'image#attribution'

  get '/:destination', to: 'search#index'


  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
