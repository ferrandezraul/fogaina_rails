# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Added by Refinery CMS Pages extension
# Refinery::Pages::Engine.load_seed  # Commented out in order to seed my own data

# Create image in order to be able to load in a page later
#moneda_social_path = "#{Rails.root.join('app/assets/images/monedasociallogo.png')}"
#image_moneda_social= Refinery::Image.create :image => File.new(moneda_social_path)

work_path = "#{Rails.root.join('app/assets/images/obrador/work.jpg')}"
image_work= Refinery::Image.create :image => File.new(work_path)

horno_path = "#{Rails.root.join('app/assets/images/obrador/horno.jpg')}"
image_horno = Refinery::Image.create :image => File.new(horno_path)

pa_de_coca_path = "#{Rails.root.join('app/assets/images/pan/padecoca.jpg')}"
image_pa_de_coca = Refinery::Image.create :image => File.new(pa_de_coca_path)

soques_path = "#{Rails.root.join('app/assets/images/pan/soques.jpg')}"
image_soques = Refinery::Image.create :image => File.new(soques_path)

pages_array = [ {
                    :show_in_menu => true,
                    :deletable => false,
                    :link_url => "/",
                    :menu_match => "^/$",
                    :title => "Home",  # default english title
                    :title_es => "Inicio",
                    :title_ca => "Inici",
                    # Image path in next line is copied from the ui when I try to add it manually
                    :body => "
                    <div class=\"row\">
                    <div class=\"large-4 columns\">
                      <img src=\"http://placehold.it/400x300&text=[img]\"/>
                      <h4>This is a content section.</h4>
                      <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong. Eiusmod swine spare ribs reprehenderit culpa. Boudin aliqua adipisicing rump corned beef.</p>
                    </div>
                    <div class=\"large-4 columns\">
                      <img src=\"http://placehold.it/400x300&text=[img]\"/>
                      <h4>This is a content section.</h4>
                      <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong. Eiusmod swine spare ribs reprehenderit culpa. Boudin aliqua adipisicing rump corned beef.</p>
                    </div>
                    <div class=\"large-4 columns\">
                      <img src=\"http://placehold.it/400x300&text=[img]\"/>
                      <h4>This is a content section.</h4>
                      <p>Bacon ipsum dolor sit amet nulla ham qui sint exercitation eiusmod commodo, chuck duis velit. Aute in reprehenderit, dolore aliqua non est magna in labore pig pork biltong. Eiusmod swine spare ribs reprehenderit culpa. Boudin aliqua adipisicing rump corned beef.</p>
                    </div>
                  </div>
                   
                  <div class=\"row\">
                    <div class=\"large-12 columns\">
                      <div class=\"panel\">
                        <h4>Get in touch!</h4>
                        <div class=\"row\">
                          <div class=\"large-9 columns\">
                            <p>We'd love to hear from you, you attractive person you.</p>
                          </div>
                          <div class=\"large-3 columns\">
                            <a href=\"#\" class=\"radius button right\">Contact Us</a>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                    ",
                    :body_es => "
                    ",
                    :body_ca => "
                    ",     
                    :side_body => "", 
                    :side_body_es => "",
                    :side_body_ca => "",                  
                    #:position_side_body => 0,
                    #:banner => banner_html[:default],
                    #:banner_es => banner_html[:es],
                    #:banner_ca => banner_html[:ca],
                    #:position_banner => 0,
                    :position_body => 1,
                    :children =>  {
                        :show_in_menu => false,
                        :deletable => false,
                        :menu_match => "^/404$",
                        :title => "Pagina no trobada",
                        :title_es => "Página no encontrada",
                        :title_ca => "Pàgina no trobada",
                        :position_body => 0,
                        :body => "<h3>Upsss! Sorry, there has been a problem ...</h3><p>The page is not available.</p><p><a href='/'>Back to home</a></p>",
                        :body_es => "<h3>Upsss! Lo sentimos, ha habido un problema ...</h3><p>La página solicitada no ha sido encontrada.</p><p><a href='/es'>Vuelva a la página de inicio</a></p>",
                        :body_ca => "<h3>Upsss! Ho sentim, hi ha hagut un problema ...</h3><p>La pàgina sol-licitada no s'ha trobat.</p><p><a href='/ca'>Tornar a la pàgina de inici</a></p>",
                    }
                },
                {
                    :show_in_menu => true,
                    :deletable => true,
                    :title => "Bread and Coffee",
                    :title_es => "Pan i Café",
                    :title_ca => "Pa i Cafè",
                    :body => "This is the body of Bread and coffee.",
                    :body_es => "Esto es el body de Pan i Cafe.",
                    :body_ca => "Això es el body de pa i cafe",
                    :side_body => "This is the side body of Bread and Coffee.", 
                    :side_body_es => "Esto es el side body de Pan in Cafe.",
                    :side_body_ca => "Això es el side body de Pa i Cafe", 
                },
                {
                    :show_in_menu => true,
                    :deletable => true,
                    :title => "Wanna know more?",
                    :title_es => "Quieres saber mas?",
                    :title_ca => "Vols saber més?",
                    :body => "This is the body of Wanna know more?",
                    :body_es => "Esto es el body de Quieres saber mas",
                    :body_ca => "Això es el body de Vols saber mes?",
                    :side_body => "This is the side body of Wanna know more?", 
                    :side_body_es => "Esto es el side body de Quieres saber mas?",
                    :side_body_ca => "Això es el side body de Vols saber mes?", 
                },
                {
                    :show_in_menu => true,
                    :deletable => true,
                    :title => "Contacte",  # default german title
                    :title_es => "Contacto",
                    :title_ca => "Contacte",
                    :body => "<div class=\"row\">
                                <div class=\"large-12 columns\">
                                  <div class=\"large-4 columns\">
                                    <h3>La Fogaina</h3>
                                    <p>Dissabtes de 9:30h a 13:30h </p>
                                    <p>Mas la Plana s/n </br> El Mallol - Carretera del Veïnat Cirera. </br> La Vall d'en Bas. </br> La Garrotxa - Girona </br> 661 38 09 55 - 639 26 48 63</p>
                                    <h3>La Fogaina Pa i Cafè.</h3>
                                    <p>De Dimarts a Dissabte de 8:00h a 13:30h i de 16:00h a 20:00h</p>
                                    <p>C/ Sant Sebastià nº52 </br> Les Preses</br> La Garrotxa - Girona</br> 646 87 90 62</p>
                                  </div>
                                  <div class=\"large-8 columns\">
                                    <div id=\"map-fogaina\"></div>
                                  </div>
                                </div>
                              </div>",
                    :body_es => "",
                    :body_ca => ""
                }
]

def finnish_page( page, page_attr )
  page.translations.create!( { :locale => 'es', :title => page_attr[:title_es] } )
  page.translations.create!( { :locale => 'ca', :title => page_attr[:title_ca] } )

  page_body_part = page.parts.create!( { :title => "Body", :body => page_attr[:body], :position => page_attr[:position_body] } )

  page_body_part.translations.create!( { :locale => "es", :body => page_attr[:body_es] } )
  page_body_part.translations.create!( { :locale => "ca", :body => page_attr[:body_ca] } )

  if page_attr.has_key?(:banner)

    page_banner_part = page.parts.create!( { :title => "Banner", :body => page_attr[:banner], :position => page_attr[:position_banner] } )

    page_banner_part.translations.create!( { :locale => "es", :body => page_attr[:banner_es] } )
    page_banner_part.translations.create!( { :locale => "ca", :body => page_attr[:banner_ca] } )

  end

  if page_attr.has_key?(:side_body)

    page_side_body_part = page.parts.create!( { :title => "Side Body", :body => page_attr[:side_body], :position => page_attr[:position_side_body] } )

    page_side_body_part.translations.create!( { :locale => "es", :body => page_attr[:side_body_es] } )
    page_side_body_part.translations.create!( { :locale => "ca", :body => page_attr[:side_body_ca] } )

  end

  if page_attr.has_key?(:children)

    children_attr = page_attr[:children]

    page_children = page.children.create!( :title => children_attr[:title],
                                           :menu_match => children_attr[:menu_match],
                                           :show_in_menu => children_attr[:menu_match],
                                           :deletable => children_attr[:deletable] )

    page_children.translations.create!( { :locale => "es", :title => children_attr[:title_es] } )
    page_children.translations.create!( { :locale => "ca", :title => children_attr[:title_ca] } )

    page_children_body_part = page_children.parts.create!( { :title => "Body", :body => children_attr[:body], :position => children_attr[:position_body] } )

    page_children_body_part.translations.create!( { :locale => "es", :body => children_attr[:body_es] } )
    page_children_body_part.translations.create!( { :locale => "ca", :body => children_attr[:body_ca] } )
  end
end


# Start here ...
pages_array.each { | page_attr |

  page_is_root = page_attr.has_key?(:menu_match) && page_attr.has_key?(:link_url) && page_attr.has_key?(:position_body)

  # Call page constructor based on the attributes available
  page = ( page_is_root ) ?
      # Just for the root page
      Refinery::Page.create!( { :show_in_menu => page_attr[:show_in_menu],
                                :deletable => page_attr[:deletable],
                                :link_url => page_attr[:link_url],
                                :menu_match => page_attr[:menu_match],
                                :title => page_attr[:title] } ) :
      # For the rest of pages
      Refinery::Page.create!( { :show_in_menu => page_attr[:show_in_menu],
                                :deletable => page_attr[:deletable],
                                :title => page_attr[:title] } )

  finnish_page( page, page_attr )
}
