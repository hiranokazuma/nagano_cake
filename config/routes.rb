Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: 'public/registrations',
    sessions: 'public/sessions'
  }
    get 'homes/about'  => "public/homes#about", as: "about"

  scope module: :public do

    root to: 'homes#top'

    resources :addresses, except:[:show, :new]

    post 'orders/confirm' => 'orders#confirm'
    get 'orders/complete' => 'orders#complete'
    resources :orders, except:[:update, :edit, :destroy]

    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, except:[:new, :show, :edit]


    resources :items, only: [:index, :show]

    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/unsubscribe' => 'customers#unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw'

  end

  devise_scope :admin do

  get '/admin/sign_out' => 'devise/sessions#destroy'

  end

  namespace :admin do

    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'
    patch 'order_details/:id' => 'order_details#update'


    resources :customers, except:[:new, :create, :destroy]

    resources :genres, except:[:new, :show, :destroy]

    resources :items, except:[:destroy]

    get 'homes/top'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
