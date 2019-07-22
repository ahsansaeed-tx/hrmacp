Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/my_jobs'
  resources :jobs do
  resources :applications
  end
  resources :applications do
    resources :interviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
