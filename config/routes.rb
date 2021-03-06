Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  root 'home#index'
  get 'home' => 'home#index'
  get 'about' => 'home#about'
  get '/users/profile' => 'users#index'
  get 'tests/index'

  resources :questions
  resources :categories
  resources :answers

  post '/users/signup' => 'users#signup'
  post '/sessions/login' => 'sessions#login'

  get '/tests/family' => 'tests#familyQuestions'
  get '/tests/food' => 'tests#foodQuestions'
  get '/tests/feelings' => 'tests#feelingsQuestions'
  get '/tests/finished_test' => 'tests#finishedTestPage'
  get '/tests/categories' => 'tests#categories'
  get '/tests/occupation' => 'tests#occupationQuestions'
  get '/tests/transportation' => 'tests#transportationQuestions'

  post '/attempts/create' => 'attempts#create'
  post '/test_attempts/create' => 'test_attempts#create'


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
