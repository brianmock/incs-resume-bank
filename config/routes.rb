Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get 'welcome/index'
  get 'users/new_teacher' => 'users#new_teacher'
  get 'users/new_school' => 'users#new_school'

  get 'resumes/additional' => 'resumes#additional'

  get 'users/school/:id' => 'users#show_school', as: :school
  get 'users/pending' => 'users#pending'
  get 'users/reset' => 'users#reset'
  get 'users/getreset' => 'users#getreset'
  put 'users/:id/activate' => 'users#activate'

  resources :users

  post 'users/password_reset' => 'users#password_reset'
  post 'users/sendpass' => 'users#sendpass'
  post 'users/search' => 'users#search'
  post 'users/export' => 'users#export'

  resources :resumes, only: [:index, :new, :create, :destroy, :update]
  root "welcome#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
