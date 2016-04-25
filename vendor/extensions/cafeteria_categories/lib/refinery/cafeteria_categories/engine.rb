module Refinery
  module CafeteriaCategories
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::CafeteriaCategories

      engine_name :refinery_cafeteria_categories

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "cafeteria_categories"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.cafeteria_categories_admin_cafeteria_categories_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::CafeteriaCategories)
      end
    end
  end
end
