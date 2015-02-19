Rails.application.routes.draw do
  get 'conferences/new'

  get 'accounts/new'

 # get 'main/new'
  
  root to: 'main#index'
  get 'users/new'
  resources :users
  resources :calls
  resources :accounts
  resources :conferences
  resources :conferences do
    member do
      get :conf
      post :conf
    end
    resources :users do
      member do
        post :call
        get :call
      end
    end
  end
  resources :calls do
    member do
      post :drop
      get :drop
    end
  end
  resources :numbers
  resources :numbers do
    member do
      post :setactive
      get :setactive
    end
  end
  resources :users do
    member do
      post :call
      get :call
    end
  end
  resources :meet

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
