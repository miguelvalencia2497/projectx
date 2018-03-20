Rails.application.routes.draw do
  devise_for :super_admins
  devise_for :admins
  root :to => redirect("/users/sign_in")
  
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get '/users/:id', :to => 'users#show', :as => :user
  get '/admin', :to => 'admin#index'
  mount RailsAdmin::Engine => '/command_center/super_admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
