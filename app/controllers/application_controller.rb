class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags, if: "request.get?"

    def prepare_meta_tags(options={})
      site_name   = "Forn La Fogaina"
      title       = [controller_name, action_name].join(" ")
      description = "Pa artesà a la Garrotxa, c/ Sant Sebastià nº52, 17178 Les Preses,"
      current_url = request.url

      # Let's prepare a nice set of defaults
      defaults = {
        site:        site_name,
        title:       title,
        description: description,
        keywords:    ["pa", "artesà", "Garrotxa", "Forn", "Vall d'en Bas"],
        twitter: {
          site_name: site_name,
          site: '@Fogaina',
          card: 'Forn Artesà',
          description: description,
        },
        og: {
          url: current_url,
          site_name: site_name,
          title: title,
          description: description,
          type: 'website'
        }
      }

      options.reverse_merge!(defaults)

      set_meta_tags options
    end
end
