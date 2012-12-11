Teamline::Application.routes.draw do
  # get 'homepage/index'
  # get '', to: 'teamline#index', constraints: lambda { |r| r.subdomain.present? && r.subdomain != 'www' }
  
  resources :users

  match 'auth/:provider/callback', to: 'sessions#create'
  match 'auth/failure', to: redirect('/')
  match 'signout', to: 'sessions#destroy', as: 'signout'

  resources :teams
  resources :people
  resources :tweets
  resources :posts
  resources :gh_events
  match '/people/:person_id/posts' => 'person_posts#index'
  match '/people/:person_id/tweets' => 'person_tweets#index'
  match '/people/:person_id/gh_events' => 'person_gh_events#index'
  root :to => 'timeline#index'
  resources :people do
    resources :tweets
    resources :gh_events
    resources :posts
  end

  get 'timeline/poll' => 'timeline#poll', :as => 'poll_timeline'
  get 'timeline/infinite' => 'timeline#infinite', :as => 'infinite_timeline'
  get 'timeline/filter' => 'timeline#filter', :as => 'filter_timeline'



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
