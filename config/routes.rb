Finner::Application.routes.draw do
  resources :login, :only => :index
  resources :signup, :only => :index
  resources :home, :only => :index
  resources :profile, :only => [:index, :edit]
  resources :mylist, :only => :index
  resources :projects, :only => [:index, :new, :edit, :destroy]

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
  root :to => 'login#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
  match 'signup/submit' => 'signup#submit'
  match 'login/submit' => 'login#submit'
  match 'home/send_contact' => 'home#send_contact'
  match 'home/logout' => 'home#logout'
  match 'profile/:account' => 'profile#index'
  match 'profile/me/edit/base' => 'profile#edit_base'
  match 'profile/me/update_base' => 'profile#update_base'
  match 'profile/me/edit/password' => 'profile#edit_password'
  match 'profile/me/update_password' => 'profile#update_password'
  match 'contacts/send_with_to_user_id/:to_user_id' => 'contacts#send_with_to_user_id', :as => :contacts_send
  match 'projects/create' => 'projects#create'
  match 'projects/:id/update' => 'projects#update'
  match 'projects/:id/send_participate_request' => 'projects#send_participate_request'
  match 'projects/:id/approve_request/:user_id' => 'projects#approve_request'
  match 'projects/:id/give_approve_to_user/:user_id' => 'projects#give_approve_to_user'
end
