Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :puzzles, only: [:index,:show]
    end
  end
  get 'welcome/index'
  root 'welcome#index'
  resources :puzzles, only: [:index,:show]
end
