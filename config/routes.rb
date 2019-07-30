Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/my_jobs'
  get 'home/schedule_interview'
  get 'home/active_jobs'
  get 'home/all_jobs'
  resources :jobs do
    resources :applications
  end
  resources :applications do
    resources :interviews
  end
  resources :interviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
