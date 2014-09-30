TenureAndPromotion::Application.routes.draw do
  #This provides all the default roles. Editable by Tech User.
  resources :default_roles
  #This is the route for editing default roles  #Point the root to the warning page for now
  root :to => 'testmode#index'
  #Hardcode contact info into the application
  get '/contact', to: 'contact#index'
  #Conversion is a "special" action. Need to convert it to a local REST API.
  get '/convert', to: 'categories#convert'
  resources :users do
    #Thes are the roles that the user can create. Nesting them here allows granular policy.
    resources :owned_roles
  end
  #Nest uploads within categories
  resources :categories do
    resources :uploads
  end
  #Converts belong straight to users, so no nesting.
  resources :converts
  get '/docs', to: 'doc#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
