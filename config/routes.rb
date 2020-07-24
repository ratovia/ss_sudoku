Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :puzzles, only: [:index,:show] do
        member do
          post :answer
        end
      end
    end
  end

  get 'welcome/index'
  root 'welcome#index'
  resources :puzzles, only: [:index,:show]
end
