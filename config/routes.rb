Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'home/my_jobs'
  get 'home/schedule_interview'
  get 'home/active_jobs'
  get 'home/all_jobs'
  get 'home/portfolio'
  get 'home/AllEmployees'
  get 'home/salary_history'
  get 'home/attendance_history'
  get 'home/accept_offer'
  get 'home/decline_offer'
  resources :jobs do
    resources :applications
  end
  resources :applications do
    resources :interviews
  end
  resources :interviews
  resources :employers
  require 'sidekiq-scheduler/web'
  mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
