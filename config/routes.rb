LetsFish::Application.routes.draw do

devise_for :users

as :user do
  get 'users/edit', :to => 'devise/registrations#edit', :as => :user_root
end

  namespace :admin do
    resources :water_types
    resources :species
      resources :fisheries do
        resources :waters
      end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homepage#index'
  get '/add/water/:id',   to: 'homepage#new_water'
  get 'search/within-bounding-box', to: 'search#within_bounding_box'
  get '/waters/all',  to: 'browse_waters#all'
  get '/destinations',  to: 'browse_destinations#index'
  get '/fisheries/all',  to: 'browse_fisheries#all'
  get '/waters/:id',      to: 'waters#show'
  get '/fisheries/:id',   to: 'fisheries#show'
  get '/trips/:username/:id', to: 'trips#show'
  get '/sitemaps',        to: 'sitemaps#index'

  get '/your/fishery', to: 'admin/fisheries#index'

  get 'weather', to: 'weather#forecast'
  get 'search',  to: 'search#index'
  get 'places', to: 'places#index'
  get 'places/info-window', to: 'places#info_window'


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
