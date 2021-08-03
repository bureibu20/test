Rails.application.routes.draw do
  resources :feeds do
    collection do
      post :confirm
    end
  end
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :favorites, only: [:create, :destroy]

  root to: "favorites#index"

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
