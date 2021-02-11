Rails.application.routes.draw do

  resources :labels, only: [:show]
  resources :topics do
  resources :posts, except: [:index]
  resources :sponsored_posts, except: [:index]
  end
  
  
  #shallow nesting
  resources :posts, only: [] do   #no posts/:id routes
    resources :comments, only: [:create, :destroy]
  
    post '/up-vote' =>  'votes#up_vote', as: :up_vote
    post '/down-vote' => 'votes#down_vote', as: :down_vote
  
  end
  

  
  get 'about' => 'welcome#about'
  root  'welcome#index'
  
  
  
  resources :users, only: [:new, :create]
  post 'users/confirm' => 'users#confirm'
  
  resources :sessions, only: [:new, :create, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
