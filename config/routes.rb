Rails.application.routes.draw do
  Rails.application.routes.draw do
    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }
  end
  get 'static/index'
  root 'static#index'
  get 'dashboard' => 'dashboard#index'
  resources :projects
  resources :institutions do
    resources :users
  end
end
