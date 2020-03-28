Rails.application.routes.draw do

  devise_for :users
  # get 'users/show'
  resources :users, :only => [:show]
  
  resources :pics do 
    member do
      put "like", to: 'pics#upvote'
    end
    resources :comments
  end

  root 'pics#index'

end
