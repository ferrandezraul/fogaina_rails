class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :prepare_meta_tags, if: "request.get?"

    def prepare_meta_tags(options={})
      site_name   = "La Fogaina Pa i Obrador"
      title       = "La Fogaina"
      description = "La Fogaina Pa i Cafè\nC/ Sant Sebastià nº52, Les Preses, La Garrotxa, Girona\n\nLa Fogaina Pa i Obrador\nC/ Verge del Carme nº13, Olot, La Garrotxa, Girona" 

      current_url = request.url

      # Let's prepare a nice set of defaults
      defaults = {
        site:        site_name,
        title:       title,
        description: description,
        keywords:    ["pa", "obrador", "fogaina", "artesà", "Garrotxa", "Forn", "Vall d'en Bas", "Olot", "Les Preses"],
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
