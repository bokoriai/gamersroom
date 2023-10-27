Rails.application.routes.draw do
  root 'public/tagsearches#search'
  #顧客用
  #URL /user/
  devise_for :users, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
      get "/about" => "homes#about"
      get "/users/unsubscribe" => "users#unsubscribe" #退会確認画面
      patch "/users/withdraw" => "users#withdraw" #退会ステータス更新
      get "/users/mypage" => "users#show"
      get "/users/information/edit" => "users#edit"
      patch "/users" => "users#update"
      get "tagsearches/search" => "tagsearches#search"
      resources :reviews do
        resources :post_comments, only: [:create, :destroy]
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
    get 'tagsearches/search' => 'tagsearches#search'
    resources :genres, only: [:index, :create, :edit, :update]
    resources :reviews do
      resources :post_comments, only: [:create]
      resource :favorites, only: [:create, :destroy]
    end
    resources :boards, only: [:index]
    resources :boardthreads do
      resources :post_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :searches, only: [:search]
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
