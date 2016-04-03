Refinery::Core::Engine.routes.draw do

  # Frontend routes
  namespace :breads do
    resources :breads, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :breads, :path => '' do
    namespace :admin, :path => Refinery::Core.backend_route do
      resources :breads, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
