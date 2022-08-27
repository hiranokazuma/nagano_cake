Rails.application.routes.draw do

  namespace :public do
    get 'addresses/index'
    get 'addresses/edit'
    get 'addresses/create'
    get 'addresses/update'
  end
    devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
    # get 'homes/top'
    get 'homes/about'  => "public/homes#about", as: "about"
    root to: 'public/homes#top'


  namespace :admin do
    get 'order_details/update'
  end
  namespace :admin do
    get 'orders/show'
    get 'orders/update'
  end
  namespace :admin do
    resources :customers
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'
  end
  namespace :admin do
    resources :genres
    # get 'genres/index'
    # get 'genres/create'
    # get 'genres/edit'
    # get 'genres/update'
  end
  namespace :admin do
    resources :items
    # get 'items/index'
    # get 'items/new'
    # get 'items/create'
    # get 'items/show'
    # get 'items/edit'
    # get 'items/update'
  end
  namespace :admin do
    get 'homes/top'
  end

    resources :addresses
    # get 'addresses/index'
    # get 'addresses/edit'
    # get 'addresses/create'
    # get 'addresses/update'

    resources :orders
    # get 'orders/new'
    # get 'orders/confirm'
    # get 'orders/complete'
    # get 'orders/create'
    # get 'orders/index'
    # get 'orders/show'

    resources :cart_items
    # get 'cart_items/index'
    # get 'cart_items/update'
    # get 'cart_items/create'

    resources :customers
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'
    # get 'customers/unscribe'
    # get 'customers/withdraw'

    resources :items
    # get 'items/index'
    # get 'items/show'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
