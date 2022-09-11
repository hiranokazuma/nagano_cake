Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
    # get 'homes/top'
    get 'homes/about'  => "public/homes#about", as: "about"

  scope module: :public do
    root to: 'homes#top'

    resources :addresses, except:[:show, :new]
    # get 'addresses/index'
    # get 'addresses/edit'
    # get 'addresses/create'
    # get 'addresses/update'

    resources :orders, except:[:update, :edit, :destroy]
      post 'orders/confirm' => 'orders#confirm'
      get 'orders/complete' => 'orders#complete'
    # get 'orders/new'
    # get 'orders/confirm'
    # get 'orders/complete'
    # get 'orders/create'
    # get 'orders/index'
    # get 'orders/show'

    resources :cart_items, except:[:new, :show, :edit]
    # get 'cart_items/index'
    # get 'cart_items/update'
    # get 'cart_items/create'
      delete 'cart_items/destroy_all' => 'cart_items#destroy'

      get 'customers/mypage' => 'customers#show'
      get 'customers/infomation/edit' => 'customers/infomation#edit'
      patch 'customers/infomation' => 'customers#update'
      get 'customers/unscribe' => 'customers#update'
      patch 'customers/withdraw' => 'customers#destroy'
    # resource :customers
    # get 'customers/mypage', to: 'customers#show', as: :customers
    # get 'customers/infomation/edit', to: 'customers/infomation#edit', as: :customers
    # patch 'customers/infomation', to: 'customers#update', as: :customers
    # get 'customers/unscribe', to: 'customers#update', as: :customers
    # patch 'customers/withdraw', to: 'customers#destroy', as: :customers

    resources :items, only: [:index, :show]
    # get 'items/index'
    # get 'items/show'

  end

  devise_scope :admin do
  get '/admin/sign_out' => 'devise/sessions#destroy'
  end

  namespace :admin do
    patch 'order_details/:id' => 'order_details#update'

    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'

    resources :customers, except:[:new, :create, :destroy]
    # get 'customers/index'
    # get 'customers/show'
    # get 'customers/edit'
    # get 'customers/update'

    resources :genres, except:[:new, :show, :destroy]

    # get 'genres/index'
    # get 'genres/create'
    # get 'genres/edit'
    # get 'genres/update'

    resources :items, except:[:destroy]
    # get 'items/index'
    # get 'items/new'
    # get 'items/create'
    # get 'items/show'
    # get 'items/edit'
    # get 'items/update'

    get 'homes/top'
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
