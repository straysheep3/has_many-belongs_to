Rails.application.routes.draw do
  devise_for :users
  resources :rooms do
    resources :chats
  end

  root "rooms#index"
end
