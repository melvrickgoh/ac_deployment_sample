Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'sessions'
  }

  as :user do
    post 'sign_in' => 'sessions#create'
    delete 'sign_out' => 'sessions#destroy'
    delete 'logout' => 'sessions#logout'
  end

  root 'welcome#index'
  mount RailsAdmin::Engine => '/ac_admin', as: 'rails_admin'

  scope 'api' do
    post 'checkout' => 'checkout#checkout'
    get 'checkout/status' => 'checkout#status'

    resources :products, only: %i(index), controller: 'api/products'

    scope 'user' do
      get 'shopping_cart' => "api/user/shopping_cart#index"
      post 'shopping_cart/add' => "api/user/shopping_cart#add_items"
      post 'shopping_cart/remove' => "api/user/shopping_cart#remove_items"
      delete 'shopping_cart' => "api/user/shopping_cart#destroy"
    
      get 'transactions' => "api/user/transactions#index"
    end
  end

  get '*path' => 'welcome#index'
end
