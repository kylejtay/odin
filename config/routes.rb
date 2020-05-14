Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get 'static/index'
  root 'static#index'
  get 'dashboard' => 'dashboard#index'
  resources :projects
  resources :time_estimates
  resources :billable_hours
  resources :companies do
    resources :users
  end
end
