Teamline::Application.routes.draw do
  # get 'homepage/index'
  # get '', to: 'teamline#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }

  resources :teams
  resources :people
  resources :tweets
  resources :posts
  resources :gh_events
  root :to => 'timeline#index'

  get 'timeline/poll' => 'timeline#poll', :as => 'poll_timeline'
  get 'timeline/infinite' => 'timeline#infinite', :as => 'infinite_timeline'
  get 'timeline/filter' => 'timeline#filter', :as => 'filter_timeline'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  
  resources :sessions
  resources :users
end
