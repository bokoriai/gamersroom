Rails.application.routes.draw do
  root to: "public/searches#search"
  #顧客用
  #URL /user/
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
      get "/about" => "homes#about"
      get "/users/unsubscribe" => "users#unsubscribe"
      get "/users/mypage" => "users#show"
      get "/users/information/edit" => "users#edit"
      patch "/users" => "users#update"
      patch "/users/withdraw" => "users#withdraw"    
      resources :reviews do
        resources :post_comments, only: [:create]
        resource :favorites, only: [:create, :destroy]
      end
      resources :boards, only: [:index, :show, :new, :create]
      resources :boardthreads do
        resources :post_comments, only: [:create, :destroy]
        resource :favorites, only: [:create, :destroy]
      end
  end
  
  #管理者用
  #URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    get '/' => 'homes#top'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :reviews do
      resources :post_comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    resources :boards, only: [:index]
    resources :boardthreads do
      resources :post_comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    resources :searches, only: [:search]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
