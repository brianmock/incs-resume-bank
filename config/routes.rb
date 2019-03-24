Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get 'welcome/index'
  get 'users/new_teacher' => 'users#new_teacher'
  post 'users/new_teacher' => 'users#create'
  get 'users/new_school' => 'users#new_school'
  post 'users/new_school' => 'users#create'

  get 'resumes/additional' => 'resumes#additional'
  get 'users/schools' => 'users#show_all_schools'
  get 'users/school/:id' => 'users#show_school', as: :school
  get 'users/pending' => 'users#pending'
  get 'users/reset' => 'users#reset'
  get 'users/getreset' => 'users#getreset'
  put 'users/:id/activate' => 'users#activate'

  get 'users/teachers' => 'users#show_all_teachers'
  get 'users/teachers-csv' => 'users#download_teachers'
  get 'users/search' => 'users#search'
  get 'users/search-csv' => 'users#download_search'
  resources :users

  get 'admin' => 'admin#index'
  get 'admin/new_school' => 'users#new_school'

  post 'users/search' => 'users#search'
  post 'users/password_reset' => 'users#password_reset'
  post 'users/sendpass' => 'users#sendpass'
  post 'users/export' => 'users#export'
  post 'users/register' => 'users#register'

  resources :resumes, only: [:index, :new, :create, :destroy, :update]
  resources :endorsements, only: [:destroy]
  resources :licenses, only: [:destroy]
  resources :organizations, only: [:destroy]
  resources :positions, only: [:destroy]
  resources :subjects, only: [:destroy]
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
