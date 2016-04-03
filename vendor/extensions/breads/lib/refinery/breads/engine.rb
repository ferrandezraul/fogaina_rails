module Refinery
  module Breads
    class Engine < Rails::Engine
      extend Refinery::Engine
      isolate_namespace Refinery::Breads

      engine_name :refinery_breads

      before_inclusion do
        Refinery::Plugin.register do |plugin|
          plugin.name = "breads"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.breads_admin_breads_path }
          plugin.pathname = root
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Breads)
      end
    end
  end
end
