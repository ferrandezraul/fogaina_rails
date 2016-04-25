Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :cafeteria_categories do
    resources :cafeteria_categories, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :cafeteria_categories, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :cafeteria_categories, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
