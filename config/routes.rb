Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'
  mount RailsAdmin::Engine => '/ac_admin', as: 'rails_admin'

  get '*path' => 'welcome#index'
end
