Blog::Application.routes.draw do


 # get "catwalks/new"

 # get "catwalks/create"

 # get "catwalks/show"

 # get "catwalks/destroy"

  get "fbposts/show"

  get "fbposts/create"

  resources :posts 
    
  
  resources :catwalks, :only=>[:new, :create, :show, :destroy, :index] 
  
  
  resource :fbpost, :only => [:show, :create]
  
   match "/auth/twitter/callback" => "sessions#create"
   match "/auth/facebook/callback" => "sessions#create"
   match "/auth/failure" => "sessions#failure"
   match "/signout" => "sessions#destroy", :as => :signout
   match "/fbpost" => "fbposts#create"
   match "/jmsg" => "posts#sayhello", :as => :jmsg
   match "/voteup" => "catwalks#vote_up", :as => :voteup
   match "/front_page" => "posts#front_page"
   match "/share_link" => "posts#share_link"
   match "/your_cats" => "catwalks#yourcats", :as => :yourcats
   match "/favcatwalks" => "catwalks#favorites", :as => :favorites
   

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
   
   root :to => "posts#front_page"
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
