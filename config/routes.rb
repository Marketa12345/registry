Rails.application.routes.draw do
  

  match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  match 'auth/failure', to: redirect('/'), via: [:get, :post]
  match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


get 'auth/:provider/callback', to: 'sessions#create'
get 'logout', to: 'sessions#destroy'

  get 'leasable/index'

  resources :contracts
 
  resources :searches
  resources :users
  #resources :renter


  resources :profiles do
    get :my, on: :collection
  end


 resources :leasable do
    get :all, on: :collection
  end
  
  resources :messages do
    get :my_messages, on: :collection
  end


  resources :subjects
  get 'home/index'


  
  root :to => "home#index"

#devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

#devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register'}
#devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register'}
devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

devise_scope :user do
  get "sign_in", to: "devise/sessions#new"
end


 resources :users do

  get :change_role, on: :member

end


 resources :contracts do

  get :terminate, on: :member

 end

  resources :subjects do

  get :leasable, on: :member
  get :not_leasable, on: :member
  get :watching, on: :member
  resources :contacts

 end



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
