Rails.application.routes.draw do
  resources :games do
    resources :participants
    post 'start'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'games#index'
end
