NewDatabase1::Application.routes.draw do 

  get "convert/index"
  get "department_admin_view", to: "department_admin_view#index"
  
  #Review Process
  get "confidentiality", to: "department_admin_view#c"
  get "select_a_candidate", to: "department_admin_view#sac"
  get "candidates_dossier", to: "department_admin_view#cd"
  get "letters_of_reccomendation", to: "department_admin_view#lor"
  get "evaluation_form", to: "department_admin_view#ef"
  get "review_and_vote", to: "department_admin_view#rav"

  get "candidate_view", to: "candidate_view#index"
  get "tenure_review_guidlines", to: "tenure_review_guidlines#index"

  #Dossier Wizard Controller
  get "initial", to: "initial#index"
  get "curriculum_vitae", to: "initial#cv"
  get "teaching_statement", to: "initial#ts"
  get "researchstatement", to: "initial#rs"
  get "servicestatement", to: "initial#ss"
  get "additional_materials", to: "initial#am"
  get "publish", to: "initial#publish"
  get "compiling", to: "initial#compile"

  #Just for testing
  get "fdisk", to: "fdisk#index"

  resources :sends

  resources :creates

  resources :sign_ins

  resources :homes

  resources :reviews

  resources :committees

  resources :committee_evaluations

  resources :candidate_profiles

  resources :votes

  resources :users

  resources :departments

  resources :colleges

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'homes#index'

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
