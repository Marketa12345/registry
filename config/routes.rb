Rails.application.routes.draw do

devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  #match 'auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  #match 'auth/failure', to: redirect('/'), via: [:get, :post]
  #match 'signout', to: 'sessions#destroy', as: 'signout', via: [:get, :post]


#get 'auth/:provider/callback', to: 'sessions#create'
#get 'logout', to: 'sessions#destroy'

  get 'leasable/index'

  resources :contracts
 
  resources :searches
  resources :users


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


end
