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

# Create one single user in order to avoid entering a user in development mode
#if Rails.env.development?
#  admin_user = Refinery::Authentication::Devise::User.create!( :username => 'test',
#                                                :email => "test@test.com", 
#                                                :password => 'test')
#
#  # Add necessary roles
#  # https://groups.google.com/d/msg/refinery-cms/akI74wnviFs/j613apqJdvgJ
#  admin_user.add_role :refinery
#  admin_user.add_role :superuser
#end

# Meta Data used to show in google both locations
META_DESCRIPTION = String.new("La Fogaina Pa i Cafè\nC/ Sant Sebastià nº52, Les Preses, La Garrotxa, Girona\n\nLa Fogaina Pa i Obrador\nC/ Verge del Carme nº13, Olot, La Garrotxa, Girona") 
BROWSER_TITLE = String.new("La Fogaina Pa i Obrador")

# Create some settings in order to enable or disable the site for other locales
# Note that in app/views/refinery/_header.html.erb those settings are checked in order
# to display or not the locale switch
Refinery::Setting.find_or_set( :spanish_web, true )
setting_es = Refinery::Setting.find_by!( name: :spanish_web )
setting_es.update!( title: "Habilitar la web en castellà")

Refinery::Setting.find_or_set( :english_web, false )
setting_en = Refinery::Setting.find_by!( name: :english_web )
setting_en.update!( title: "Habilitar la web en anglès")

# Added by Refinery CMS Image Slides extension
Refinery::ImageSlideshows::Engine.load_seed

# Path to images in SLIDE SHOW IN HOME PAGE
slideshow_img1_path = "#{Rails.root.join('app/assets/images/slideshow/1000x400/IMG_2178.jpg')}"
slideshow_img2_path = "#{Rails.root.join('app/assets/images/slideshow/1000x400/IMG_2550.jpg')}"
slideshow_img3_path = "#{Rails.root.join('app/assets/images/slideshow/1000x400/IMG_1523.jpg')}"
slideshow_img4_path = "#{Rails.root.join('app/assets/images/slideshow/1000x400/IMG_3421.jpg')}"
slideshow_img5_path = "#{Rails.root.join('app/assets/images/slideshow/1000x400/IMG_4151.jpg')}"
slideshow_img6_path = "#{Rails.root.join('app/assets/images/slideshow/1000x400/IMG_4751.jpg')}"

# Images in SLIDE SHOW IN HOME PAGE
slideshow_img1 = Refinery::Image.create :image => File.new(slideshow_img1_path)
slideshow_img2 = Refinery::Image.create :image => File.new(slideshow_img2_path)
slideshow_img3 = Refinery::Image.create :image => File.new(slideshow_img3_path)
slideshow_img4 = Refinery::Image.create :image => File.new(slideshow_img4_path)
slideshow_img5 = Refinery::Image.create :image => File.new(slideshow_img5_path)
slideshow_img6 = Refinery::Image.create :image => File.new(slideshow_img6_path)

slide_images = [
  {
    :title => "1", 
    :image_id => slideshow_img1.id 
  },
  {
    :title => "2", 
    :image_id => slideshow_img2.id 
  },
  {
    :title => "3", 
    :image_id => slideshow_img3.id 
  },
  {
    :title => "4", 
    :image_id => slideshow_img4.id 
  },
  {
    :title => "5", 
    :image_id => slideshow_img5.id 
  },
  {
    :title => "6", 
    :image_id => slideshow_img6.id 
  }
]

#binding.pry

slide_images.each do | slide_image |

  refinery_image_slide = Refinery::ImageSlideshows::ImageSlide.create!( 
    :title => slide_image[:title], 
    :image_id => slide_image[:image_id] )

  refinery_image_slide.translations.create!( :locale => :ca, :title => slide_image[:title] )
  refinery_image_slide.translations.create!( :locale => :es, :title => slide_image[:title] )
end

slider = Refinery::ImageSlideshows::ImageSlideshow.create!( :title => "Carrousel d'imatges de la pagina d'inici")
slider.image_slides = Refinery::ImageSlideshows::ImageSlide.all.to_a

pages_array = [ {
                    :show_in_menu => true,
                    :deletable => false,
                    :link_url => "/",
                    :menu_match => "^/$",
                    :title => "Home",  # default english title
                    :title_es => "Inicio",
                    :title_ca => "Inici",
                    # Image path in next line is copied from the ui when I try to add it manually
                    :body => "",
                    :body_es => "",
                    :body_ca => "",    
                    :side_body => "", 
                    :side_body_es => "",
                    :side_body_ca => "", 
                    :meta_description => META_DESCRIPTION,
                    :browser_title => BROWSER_TITLE,                 
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
                        :body => "<h4>Upsss! Sorry, there has been a problem ...</h4><p>The page is not available.</p><p><a href='/en'>Back to home</a></p>",
                        :body_es => "<h4>Upsss! Lo sentimos, ha habido un problema ...</h4><p>La página solicitada no ha sido encontrada.</p><p><a href='/es'>Vuelva a la página de inicio</a></p>",
                        :body_ca => "<h4>Upsss! Ho sentim, hi ha hagut un problema ...</h4><p>La pàgina sol-licitada no s'ha trobat.</p><p><a href='/ca'>Tornar a la pàgina de inici</a></p>",
                    }
                },
                {
                    :show_in_menu => true,
                    :deletable => true,
                    :title => "Who are we?",
                    :title_es => "Quienes somos?",
                    :title_ca => "Qui som",
                    :view_template => "qui_som", # custom view template (see /app/views/refinery/pages/qui_som.html.erb)
                    :body => "<p>Avui, La Fogaina som un col·lectiu de 5 socis que treballem de forma cooperativa i assembleària. Va nèixer en un primer moment d'una necessitat econòmica familiar, la necessitat de sortir de la precarietat laboral i aconseguir una estabilitat que feia temps que no teníem. Acabàvem d'aterrar a la Garrotxa, era el 2011 i just llavors vaig descobrir una passió que no sabia que tenia, fer pa.</p>
                              <p>Recordo amb un somriure els primers dies que vaig començar a indagar en aquest món panarra, sobretot via internet, visitant fòrums, webs i vídeos; al·lucinava amb la quantitat de tècniques i mètodes que existien, que no podia evitar provar, i convertia la cuina de casa a qualsevol hora del dia o de la nit en el laboratori d'un alquimista boig. Va ser quan vaig fer la nostra primera massa mare natural, que encara avui ens acompanya cada dia a la feina. No negaré que el salt de forner casolà a professional va ser una bogeria, un gran pas on hi ha massa aspectes que no controles i no els veus venir fins que te'ls trobes de cop. No vinc d'una família de forners, ni he estudiat a l'escola de flequers Allò que realment necessitava, com poder formar-me a l'estranger on sí que considerava que hi havia bon pa i bones escoles, ja se'm feia molt difícil: arrossegar a tota la família a França, o Alemanya, sense idioma, sense diners, a estudiar en escoles normalment bastant cares ...
                              Així que gairebé que no ens va quedar més remei que tirar-nos-hi de cap ... sense saber nedar, sense flotador ni braçals ... gairebé ens ofeguem. És un ofici dur i el camí escollit no és el més fàcil, però ens mantenim a flotació , i les aigües ja van més tranquil·les.
                              Sort de la quantitat de gent que pel camí ens ha ajudat, de moltes maneres, sense ells no ho hauríem aconseguit. Sona tòpic, però és cert.</p>
                              <p>Tanmateix i sobretot, el que més ens ha importat ha estat la qualitat del nostre producte. Sempre ens hem preocupat per aprendre i millorar, i per això hem visitat i conegut forners i fleques que ens han aportat tècniques, mètodes, il·lusió i passió per l'ofici. Com la petita fleca regentada per un sol forner, l'Stephane, un projecte preciós del sud de França del qual gairebé vam ser un mirall durant els dos primers anys: farines ecològiques, massa mare, forn de llenya i un procés molt manual. També, vam tenir la sort de visitar The loaf, un projecte de fleca efímera a Donosti, amb Dan Lepard al capdavant, un forner molt experimentat i millor persona. Ens van obrir les portes a poder treballar 3 dies braç a braç a l'obrador, va ser màgic i increïble, l'oportunitat de pastar, formar i enfornar desenes de pans, viure el ritme real d'un obrador, compartir xerrades amb autèntics cracs com el mateix Dan i els forners que treballaven allà: Iban Yarza, amb qui hem coincidit altres vegades; Pablo Conesa, de Sevilla, que estava de visita, molts panarres casolans..., un autèntic luxe.</p>
                              <p>A poc a poc, ha anat entrant gent nova al projecte, al principi per aprendre i ajudar a l'obrador, després per muntar la fleca-cafeteria al poble i de seguida, per afegir el punt dolç que ens faltava. És aquest un moment important en la nostra petita història, quan vam decidir, amb dues famílies més, convertir La Fogaina, en un projecte cooperatiu, on 5 socis decidim de manera assembleària el nostre futur, tot gestionant l'obrador i la fleca-cafeteria amb l'objectiu de mantenir i millorar la nostra qualitat i la nostra producció, i tenir una feina i sou dignes. Ens hi anem acostant. Quan decideixes convertir un projecte familiar en un projecte cooperatiu assumeixes que comences a treballar en equip, sumant i aportant idees i energia al projecte, i això dóna força i moral en els moments difícils.</p>
                              <p>Estem molt orgullosos del que hem aconseguit fins ara, treballem dur i tenim un producte honest i saludable. La Fogaina és una suma dels qui la formem, de manera que és més viva que mai. Sembla clar que, com fa cada dia la nostra massa mare, continuarem creixent, amb noves idees i encara més sorpreses.
                              Esperem que gaudiu dels nostres productes, del nostre espai i del nostre tracte…</p>",
                    :body_es => "<p>Hoy, La Fogaina somos un colectivo de 5 socios que trabajamos de forma cooperativa y asamblearia. Nació en un primer momento de una necesidad económica familiar, la necesidad de salir de la precariedad laboral y conseguir una estabilidad que hacía tiempo que no teníamos. Acabábamos de aterrizar en la Garrotxa, era en 2011 y justo entonces descubrí una pasión que no sabía que tenía, hacer pan. </p>
                              <p> Recuerdo con una sonrisa en los primeros días que empecé a indagar en este mundo panarra, sobre todo vía internet, visitando foros, webs y vídeos; alucinaba con la cantidad de técnicas y métodos que existían, que no podía evitar probar, y convertía la cocina de su casa a cualquier hora del día o de la noche en el laboratorio de un alquimista loco. Fue cuando hice nuestra primera masa madre natural, que todavía hoy nos acompaña cada día en el trabajo. No negaré que el salto de panadero casero profesional fue una locura, un gran paso donde hay demasiados aspectos que no controlas y no los ves venir hasta que te los encuentras de golpe. No vengo de una familia de panaderos, ni he estudiado en la escuela de panaderos Lo que realmente necesitaba, como poder formarme en el extranjero donde sí consideraba que había buen pan y buenas escuelas, ya se me hacía muy difícil: arrastrar a toda la familia en Francia, o Alemania, sin idioma, sin dinero, a estudiar en escuelas normalmente bastante caras ... Así que casi no nos quedó más remedio que tirar a ella de cabeza ... sin saber nadar, sin flotador ni brazaletes ... casi nos ahogamos. Es un oficio duro y el camino elegido no es el más fácil, pero nos mantenemos a flote, y las aguas ya más tranquilas. Suerte de la cantidad de gente que por el camino nos ha ayudado, de muchas maneras, sin ellos no lo habríamos conseguido. Suena tópico, pero es cierto. </p>
                              <p> Sin embargo y sobre todo, lo que más nos ha importado ha sido la calidad de nuestro producto. Siempre nos hemos preocupado por aprender y mejorar, y por eso hemos visitado y conocido panaderos y panaderías que nos han aportado técnicas, métodos, ilusión y pasión por el oficio. Como la pequeña panadería regentada por un solo panadero, el Stephane, un proyecto precioso del sur de Francia del que casi fuimos un espejo durante los dos primeros años: harinas ecológicas, masa madre, horno de leña y un proceso muy manual. También, tuvimos la suerte de visitar The loaf, un proyecto de panadería efímera en Donosti, con Dan Lepard a la cabeza, un panadero muy experimentado y mejor persona. Nos abrieron las puertas a poder trabajar 3 días codo con codo en el obrador, fue mágico e increíble, la oportunidad de amasar, formar y hornear decenas de panes, vivir el ritmo real de un obrador, compartir charlas con auténticos cracks como el mismo Dan y los panaderos que trabajaban allí: Iban Yarza, con quien hemos coincidido en otras ocasiones; Pablo Conesa, de Sevilla, que estaba de visita, muchos Panarra caseros ..., un auténtico lujo. </p>
                              <p> Poco a poco, ha ido entrando gente nueva al proyecto, al principio para aprender y ayudar en el obrador, luego para montar la panadería-cafetería en el pueblo y enseguida, para añadir el punto dulce que nos faltaba. Es este un momento importante en nuestra pequeña historia, cuando decidimos, con dos familias más, convertir La Fogaina, en un proyecto cooperativo, donde 5 socios decidimos de manera asamblearia nuestro futuro, gestionando el obrador y la panadería-cafetería con el objetivo de mantener y mejorar nuestra calidad y nuestra producción, y tener un trabajo y sueldo dignos. Nos vamos acercando. Cuando decides convertir un proyecto familiar en un proyecto cooperativo asumes que comienzas a trabajar en equipo, sumando y aportando ideas y energía al proyecto, lo que da fuerza y ​​moral en los momentos difíciles. </p>
                              <p> Estamos muy orgullosos de lo que hemos logrado hasta ahora, trabajamos duro y tenemos un producto honesto y saludable. La Fogaina es una suma de los que la formamos, por lo que es más viva que nunca. Parece claro que, como hace cada día nuestra masa madre, continuaremos creciendo, con nuevas ideas y aún más sorpresas. Esperamos que disfrutéis de nuestros productos, de nuestro espacio y de nuestro trato ... </p>",
                    :body_ca => "<p>Avui, La Fogaina som un col·lectiu de 5 socis que treballem de forma cooperativa i assembleària. Va nèixer en un primer moment d'una necessitat econòmica familiar, la necessitat de sortir de la precarietat laboral i aconseguir una estabilitat que feia temps que no teníem. Acabàvem d'aterrar a la Garrotxa, era el 2011 i just llavors vaig descobrir una passió que no sabia que tenia, fer pa.</p>
                              <p>Recordo amb un somriure els primers dies que vaig començar a indagar en aquest món panarra, sobretot via internet, visitant fòrums, webs i vídeos; al·lucinava amb la quantitat de tècniques i mètodes que existien, que no podia evitar provar, i convertia la cuina de casa a qualsevol hora del dia o de la nit en el laboratori d'un alquimista boig. Va ser quan vaig fer la nostra primera massa mare natural, que encara avui ens acompanya cada dia a la feina.
                              No negaré que el salt de forner casolà a professional va ser una bogeria, un gran pas on hi ha massa aspectes que no controles i no els veus venir fins que te'ls trobes de cop. No vinc d'una família de forners, ni he estudiat a l'escola de flequers Allò que realment necessitava, com poder formar-me a l'estranger on sí que considerava que hi havia bon pa i bones escoles, ja se'm feia molt difícil: arrossegar a tota la família a França, o Alemanya, sense idioma, sense diners, a estudiar en escoles normalment bastant cares ...
                              Així que gairebé que no ens va quedar més remei que tirar-nos-hi de cap ... sense saber nedar, sense flotador ni braçals ... gairebé ens ofeguem. És un ofici dur i el camí escollit no és el més fàcil, però ens mantenim a flotació , i les aigües ja van més tranquil·les.
                              Sort de la quantitat de gent que pel camí ens ha ajudat, de moltes maneres, sense ells no ho hauríem aconseguit. Sona tòpic, però és cert.</p>
                              <p>Tanmateix i sobretot, el que més ens ha importat ha estat la qualitat del nostre producte. Sempre ens hem preocupat per aprendre i millorar, i per això hem visitat i conegut forners i fleques que ens han aportat tècniques, mètodes, il·lusió i passió per l'ofici. Com la petita fleca regentada per un sol forner, l'Stephane, un projecte preciós del sud de França del qual gairebé vam ser un mirall durant els dos primers anys: farines ecològiques, massa mare, forn de llenya i un procés molt manual. També, vam tenir la sort de visitar The loaf, un projecte de fleca efímera a Donosti, amb Dan Lepard al capdavant, un forner molt experimentat i millor persona. Ens van obrir les portes a poder treballar 3 dies braç a braç a l'obrador, va ser màgic i increïble, l'oportunitat de pastar, formar i enfornar desenes de pans, viure el ritme real d'un obrador, compartir xerrades amb autèntics cracs com el mateix Dan i els forners que treballaven allà: Iban Yarza, amb qui hem coincidit altres vegades; Pablo Conesa, de Sevilla, que estava de visita, molts panarres casolans..., un autèntic luxe.</p>
                              <p>A poc a poc, ha anat entrant gent nova al projecte, al principi per aprendre i ajudar a l'obrador, després per muntar la fleca-cafeteria al poble i de seguida, per afegir el punt dolç que ens faltava. És aquest un moment important en la nostra petita història, quan vam decidir, amb dues famílies més, convertir La Fogaina, en un projecte cooperatiu, on 5 socis decidim de manera assembleària el nostre futur, tot gestionant l'obrador i la fleca-cafeteria amb l'objectiu de mantenir i millorar la nostra qualitat i la nostra producció, i tenir una feina i sou dignes. Ens hi anem acostant. Quan decideixes convertir un projecte familiar en un projecte cooperatiu assumeixes que comences a treballar en equip, sumant i aportant idees i energia al projecte, i això dóna força i moral en els moments difícils.</p>
                              <p>Estem molt orgullosos del que hem aconseguit fins ara, treballem dur i tenim un producte honest i saludable. La Fogaina és una suma dels qui la formem, de manera que és més viva que mai. Sembla clar que, com fa cada dia la nostra massa mare, continuarem creixent, amb noves idees i encara més sorpreses.
                              Esperem que gaudiu dels nostres productes, del nostre espai i del nostre tracte…</p>",
                    :side_body => "", 
                    :side_body_es => "",
                    :side_body_ca => "",
                    :meta_description => META_DESCRIPTION, 
                    :browser_title => BROWSER_TITLE,
                },
                {
                    :show_in_menu => true,
                    :deletable => true,
                    :title => "Backery",
                    :title_es => "Horno",
                    :title_ca => "Forn",
                    :body => "",
                    :body_es => "",
                    :body_ca => "",
                    :side_body => "", 
                    :side_body_es => "",
                    :side_body_ca => "",
                    :meta_description => META_DESCRIPTION, 
                    :browser_title => BROWSER_TITLE,
                },
                {
                    :show_in_menu => true,
                    :deletable => true,
                    :title => "Where are we?",  # default german title
                    :title_es => "Dónde encontrarnos?",
                    :title_ca => "On trobar-nos?",
                    :view_template => "on_som",
                    :meta_description => META_DESCRIPTION, 
                    :browser_title => BROWSER_TITLE,
                    :body => "<div class=\"row\">
                                  <div class=\"large-4 columns\">
                                    <div class=\"panel\">
                                      <h4>La Fogaina Pa i Cafè</h4>
                                      <p><i class=\"fi-marker\"> c/ Sant Sebastià nº52, Les Preses, Girona</i><br><i class=\"fi-telephone\"> 646 87 90 62</i></p>
                                      <table>
                                        <tr>
                                          <th>Timatable</th>
                                          <th>Morning</th> 
                                          <th>Afternoon</th>
                                        </tr>
                                        <tr>
                                          <td>Monday</td>
                                          <td>Closed</td> 
                                          <td>Closed</td>
                                        </tr>
                                        <tr>
                                          <td>Tuesday</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Wednesday</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Thursday</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Friday</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Saturday</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Sunday</td>
                                          <td>Closed</td> 
                                          <td>Closed</td>
                                        </tr>
                                      </table>
                                    </div>
                                  </div>

                                  <div class=\"large-8 columns\">
                                    <div id=\"map-fogaina\">
                                      <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2958.192843809303!2d2.4581033154084873!3d42.14615995657543!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a534c9267799b7%3A0x1ca1e342e06d6353!2sLa+Fogaina!5e0!3m2!1ses!2ses!4v1467997119084\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>
                                    </div>
                                  </div>

                                </div>
                                <div class=\"row\">
                                  <div class=\"large-4 columns\">
                                    <div class=\"panel\">
                                      <h4>La Fogaina Pa i Obrador</h4>
                                      <p><i class=\"fi-marker\"> c/ Verge del Carme nº13, Olot, Girona</i><br><i class=\"fi-telephone\"> 621 20 58 06</i> / <i class=\"fi-telephone\"> 872 20 29 15</i></p>
                                      <table>
                                        <tr>
                                          <th>Timetable</th>
                                          <th>Morning</th> 
                                          <th>Afternoon</th>
                                        </tr>
                                        <tr>
                                          <td>Monday</td>
                                          <td>9:30h-13:30h</td> 
                                          <td>Closed</td>
                                        </tr>
                                        <tr>
                                          <td>Tuesady</td>
                                          <td>9:30h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Wednesday</td>
                                          <td>9:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Thursday</td>
                                          <td>9:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Friday</td>
                                          <td>9:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Saturday</td>
                                          <td>9:30h-13:30h</td> 
                                          <td>Closed</td>
                                        </tr>
                                        <tr>
                                          <td>Sunday</td>
                                          <td>Closed</td> 
                                          <td>Closed</td>
                                        </tr>
                                      </table>
                                    </div>
                                  </div>

                                  <div class=\"large-8 columns\">
                                    <div id=\"map-fogaina\">
                                      <iframe src=\"https://maps.google.com/maps?width=100%&height=600&hl=es&coord=42.183413, 2.491903&q=Verge%20del%20Carme%2C%2013%20Olot%2C%20Girona%2C%20Spain+(La%20Fogaina%20Pa%20i%20Obrador)&ie=UTF8&t=&z=15&iwloc=B&output=embed\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>
                                    </div>
                                  </div>

                                </div>",
                              # iframe from google maps with both addresses
                              # <iframe src=\"https://www.google.com/maps/d/embed?mid=1u3uXVLo7fFatVt75Qx2thOGiTNOPAdOa\" width=\"640\" height=\"480\"></iframe>
                    :body_es => "<div class=\"row\">
                                  <div class=\"large-4 columns\">
                                    <div class=\"panel\">
                                      <h4>La Fogaina Pa i Cafè</h4>
                                      <p><i class=\"fi-marker\"> c/ Sant Sebastià nº52, Les Preses, Girona</i><br><i class=\"fi-telephone\"> 646 87 90 62</i></p>
                                      <table>
                                        <tr>
                                          <th>Horario</th>
                                          <th>Mañana</th> 
                                          <th>Tarde</th>
                                        </tr>
                                        <tr>
                                          <td>Lunes</td>
                                          <td>Cerrado</td> 
                                          <td>Cerrado</td>
                                        </tr>
                                        <tr>
                                          <td>Martes</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Miércoles</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Jueves</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Viernes</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Sábado</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Domingo</td>
                                          <td>Cerrado</td> 
                                          <td>Cerrado</td>
                                        </tr>
                                      </table>
                                    </div>
                                  </div>

                                  <div class=\"large-8 columns\">
                                    <div id=\"map-fogaina\">
                                      <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2958.192843809303!2d2.4581033154084873!3d42.14615995657543!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a534c9267799b7%3A0x1ca1e342e06d6353!2sLa+Fogaina!5e0!3m2!1ses!2ses!4v1467997119084\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>
                                    </div>
                                  </div>

                                </div>
                                <div class=\"row\">
                                  <div class=\"large-4 columns\">
                                    <div class=\"panel\">
                                      <h4>La Fogaina Pa i Obrador</h4>
                                      <p><i class=\"fi-marker\"> c/ Verge del Carme nº13, Olot, Girona</i><br><i class=\"fi-telephone\"> 621 20 58 06</i> / <i class=\"fi-telephone\"> 872 20 29 15</i></p>
                                      <table>
                                        <tr>
                                          <th>Horario</th>
                                          <th>Mañana</th> 
                                          <th>Tarde</th>
                                        </tr>
                                        <tr>
                                          <td>Lunes</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>Cerrado</td>
                                        </tr>
                                        <tr>
                                          <td>Martes</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Miércoles</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Jueves</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Viernes</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Sábado</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>Cerrado</td>
                                        </tr>
                                        <tr>
                                          <td>Domingo</td>
                                          <td>Cerrado</td> 
                                          <td>Cerrado</td>
                                        </tr>
                                      </table>
                                    </div>
                                  </div>

                                  <div class=\"large-8 columns\">
                                    <div id=\"map-fogaina\">
                                      <iframe src=\"https://maps.google.com/maps?width=100%&height=600&hl=es&coord=42.183413, 2.491903&q=Verge%20del%20Carme%2C%2013%20Olot%2C%20Girona%2C%20Spain+(La%20Fogaina%20Pa%20i%20Obrador)&ie=UTF8&t=&z=15&iwloc=B&output=embed\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>
                                    </div>
                                  </div>

                                </div>",
                              # iframe from google maps with both addresses
                              # <iframe src=\"https://www.google.com/maps/d/embed?mid=1u3uXVLo7fFatVt75Qx2thOGiTNOPAdOa\" width=\"640\" height=\"480\"></iframe>
                    :body_ca => "<div class=\"row\">
                                  <div class=\"large-4 columns\">
                                    <div class=\"panel\">
                                      <h4>La Fogaina Pa i Cafè</h4>
                                      <p><i class=\"fi-marker\"> c/ Sant Sebastià nº52, Les Preses, Girona</i><br><i class=\"fi-telephone\"> 646 87 90 62</i></p>
                                      <table>
                                        <tr>
                                          <th>Horari</th>
                                          <th>Matí</th> 
                                          <th>Tarda</th>
                                        </tr>
                                        <tr>
                                          <td>Dilluns</td>
                                          <td>Tancat</td> 
                                          <td>Tancat</td>
                                        </tr>
                                        <tr>
                                          <td>Dimarts</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Dimecres</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Dijous</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Divendres</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Dissabte</td>
                                          <td>8h-13:30h</td> 
                                          <td>16h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Diumenge</td>
                                          <td>Tancat</td> 
                                          <td>Tancat</td>
                                        </tr>
                                      </table>
                                    </div>
                                  </div>

                                  <div class=\"large-8 columns\">
                                    <div id=\"map-fogaina\">
                                      <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2958.192843809303!2d2.4581033154084873!3d42.14615995657543!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12a534c9267799b7%3A0x1ca1e342e06d6353!2sLa+Fogaina!5e0!3m2!1ses!2ses!4v1467997119084\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>
                                    </div>
                                  </div>

                                </div>
                                <div class=\"row\">
                                  <div class=\"large-4 columns\">
                                    <div class=\"panel\">
                                      <h4>La Fogaina Pa i Obrador</h4>
                                      <p><i class=\"fi-marker\"> c/ Verge del Carme nº13, Olot, Girona</i><br><i class=\"fi-telephone\"> 621 20 58 06</i> / <i class=\"fi-telephone\"> 872 20 29 15</i></p>
                                      <table>
                                        <tr>
                                          <th>Horari</th>
                                          <th>Matí</th> 
                                          <th>Tarda</th>
                                        </tr>
                                        <tr>
                                          <td>Dilluns</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>Tancat</td>
                                        </tr>
                                        <tr>
                                          <td>Dimarts</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Dimecres</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Dijous</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Divendres</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>17h-20h</td>
                                        </tr>
                                        <tr>
                                          <td>Dissabte</td>
                                          <td>8:30h-13:30h</td> 
                                          <td>Tancat</td>
                                        </tr>
                                        <tr>
                                          <td>Diumenge</td>
                                          <td>Tancat</td> 
                                          <td>Tancat</td>
                                        </tr>
                                      </table>
                                    </div>
                                  </div>

                                  <div class=\"large-8 columns\">
                                    <div id=\"map-fogaina\">
                                      <iframe src=\"https://maps.google.com/maps?width=100%&height=600&hl=es&coord=42.183413, 2.491903&q=Verge%20del%20Carme%2C%2013%20Olot%2C%20Girona%2C%20Spain+(La%20Fogaina%20Pa%20i%20Obrador)&ie=UTF8&t=&z=15&iwloc=B&output=embed\" width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>
                                    </div>
                                  </div>

                                </div>"
                              # iframe for the new address:
                              # <div style="width: 100%"><iframe width="100%" height="600" src="https://maps.google.com/maps?width=100%&height=600&hl=es&coord=42.183413, 2.491903&q=Verge%20del%20Carme%2C%2013%20Olot%2C%20Girona%2C%20Spain+(La%20Fogaina%20Pa%20i%20Obrador)&ie=UTF8&t=&z=15&iwloc=B&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"><a href="https://www.mapsdirections.info/calcular-ruta.html">mapas y direcciones</a></iframe></div><br />
                              # iframe from google maps with both addresses
                              # <iframe src=\"https://www.google.com/maps/d/embed?mid=1u3uXVLo7fFatVt75Qx2thOGiTNOPAdOa\" width=\"640\" height=\"480\"></iframe>
                }

]

def finnish_page( page, page_attr )
  page.translations.create!( { :locale => 'es', 
                               :title => page_attr[:title_es],
                               :meta_description => META_DESCRIPTION, 
                                :browser_title => BROWSER_TITLE } )
  page.translations.create!( { :locale => 'ca', 
                               :title => page_attr[:title_ca],
                               :meta_description => META_DESCRIPTION, 
                                :browser_title => BROWSER_TITLE } )

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
                                           :show_in_menu => children_attr[:show_in_menu],
                                           :deletable => children_attr[:deletable] )

    page_children.translations.create!( { :locale => "es", 
                                          :title => children_attr[:title_es],
                                          :meta_description => META_DESCRIPTION, 
                                          :browser_title => BROWSER_TITLE }  )
    page_children.translations.create!( { :locale => "ca", 
                                          :title => children_attr[:title_ca],
                                          :meta_description => META_DESCRIPTION, 
                                          :browser_title => BROWSER_TITLE } )

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
                                :view_template => page_attr[:view_template],
                                :title => page_attr[:title],
                                :meta_description => page_attr[:meta_description],
                                :browser_title => page_attr[:browser_title] } ) :
      # For the rest of pages
      Refinery::Page.create!( { :show_in_menu => page_attr[:show_in_menu],
                                :deletable => page_attr[:deletable],
                                :view_template => page_attr[:view_template],
                                :title => page_attr[:title],
                                :meta_description => page_attr[:meta_description],
                                :browser_title => page_attr[:browser_title] } )

  finnish_page( page, page_attr )
}

# Path to images PAN
soca_path = "#{Rails.root.join('app/assets/images/pan/soca.jpg')}"
soca2_path = "#{Rails.root.join('app/assets/images/pan/soca2.jpg')}"
soca3_path = "#{Rails.root.join('app/assets/images/pan/soca3.jpg')}"

pa_pages_path = "#{Rails.root.join('app/assets/images/pan/padepages.jpg')}"
pa_pages2_path = "#{Rails.root.join('app/assets/images/pan/padepages2.jpg')}"
pa_pages3_path = "#{Rails.root.join('app/assets/images/pan/padepages3.jpg')}"

pa_rustic_path = "#{Rails.root.join('app/assets/images/pan/rustic.jpg')}"
pa_rustic2_path = "#{Rails.root.join('app/assets/images/pan/rustic2.jpg')}"
pa_rustic3_path = "#{Rails.root.join('app/assets/images/pan/rustic3.jpg')}"

pa_pigat_path = "#{Rails.root.join('app/assets/images/pan/pigat.jpg')}"
pa_pigat2_path = "#{Rails.root.join('app/assets/images/pan/pigat2.jpg')}"
pa_pigat3_path = "#{Rails.root.join('app/assets/images/pan/pigat3.jpg')}"

pa_espelta_path = "#{Rails.root.join('app/assets/images/pan/espelta.jpg')}"
pa_espelta2_path = "#{Rails.root.join('app/assets/images/pan/espelta2.jpg')}"
pa_espelta3_path = "#{Rails.root.join('app/assets/images/pan/espelta3.jpg')}"

coca_forner_path = "#{Rails.root.join('app/assets/images/pan/cocaforner.jpg')}"
coca_forner2_path = "#{Rails.root.join('app/assets/images/pan/cocaforner2.jpg')}"
coca_forner3_path = "#{Rails.root.join('app/assets/images/pan/cocaforner3.jpg')}"

pa_de_coca_path = "#{Rails.root.join('app/assets/images/pan/padecoca.jpg')}"
pa_de_coca2_path = "#{Rails.root.join('app/assets/images/pan/padecoca2.jpg')}"
pa_de_coca3_path = "#{Rails.root.join('app/assets/images/pan/padecoca3.jpg')}"

pa_brot_negre_path = "#{Rails.root.join('app/assets/images/pan/brotnegre.jpg')}"
pa_brot_negre2_path = "#{Rails.root.join('app/assets/images/pan/brotnegre2.jpg')}"
pa_brot_negre3_path = "#{Rails.root.join('app/assets/images/pan/brotnegre3.jpg')}"

pa_bembo_path = "#{Rails.root.join('app/assets/images/pan/bembo.jpg')}"
pa_bembo2_path = "#{Rails.root.join('app/assets/images/pan/bembo2.jpg')}"
pa_bembo3_path = "#{Rails.root.join('app/assets/images/pan/bembo3.jpg')}"

pa_tinosell_path = "#{Rails.root.join('app/assets/images/pan/tinosell.jpg')}"
pa_tinosell2_path = "#{Rails.root.join('app/assets/images/pan/tinosell2.jpg')}"

pa_fajol_path = "#{Rails.root.join('app/assets/images/pan/fajol.jpg')}"
pa_fajol2_path = "#{Rails.root.join('app/assets/images/pan/fajol2.jpg')}"
pa_fajol3_path = "#{Rails.root.join('app/assets/images/pan/fajol3.jpg')}"

# Images PAN
image_soca = Refinery::Image.create :image => File.new(soca_path)
image_soca2 = Refinery::Image.create :image => File.new(soca2_path)
image_soca3 = Refinery::Image.create :image => File.new(soca3_path)

image_pa_de_pages = Refinery::Image.create :image => File.new(pa_pages_path)
image_pa_de_pages2 = Refinery::Image.create :image => File.new(pa_pages2_path)
image_pa_de_pages3 = Refinery::Image.create :image => File.new(pa_pages3_path)

image_pa_rustic = Refinery::Image.create :image => File.new(pa_rustic_path)
image_pa_rustic2 = Refinery::Image.create :image => File.new(pa_rustic2_path)
image_pa_rustic3 = Refinery::Image.create :image => File.new(pa_rustic3_path)

image_pa_pigat = Refinery::Image.create :image => File.new(pa_pigat_path)
image_pa_pigat2 = Refinery::Image.create :image => File.new(pa_pigat2_path)
image_pa_pigat3 = Refinery::Image.create :image => File.new(pa_pigat3_path)

image_pa_espelta = Refinery::Image.create :image => File.new(pa_espelta_path)
image_pa_espelta2 = Refinery::Image.create :image => File.new(pa_espelta2_path)
image_pa_espelta3 = Refinery::Image.create :image => File.new(pa_espelta3_path)

image_coca_forner = Refinery::Image.create :image => File.new(coca_forner_path)
image_coca_forner2 = Refinery::Image.create :image => File.new(coca_forner2_path)
image_coca_forner3 = Refinery::Image.create :image => File.new(coca_forner3_path)

image_pa_de_coca = Refinery::Image.create :image => File.new(pa_de_coca_path)
image_pa_de_coca2 = Refinery::Image.create :image => File.new(pa_de_coca2_path)
image_pa_de_coca3 = Refinery::Image.create :image => File.new(pa_de_coca3_path)

image_brot_negre = Refinery::Image.create :image => File.new(pa_brot_negre_path)
image_brot_negre2 = Refinery::Image.create :image => File.new(pa_brot_negre2_path)
image_brot_negre3 = Refinery::Image.create :image => File.new(pa_brot_negre3_path)

image_pa_bembo = Refinery::Image.create :image => File.new(pa_bembo_path)
image_pa_bembo2 = Refinery::Image.create :image => File.new(pa_bembo2_path)
image_pa_bembo3 = Refinery::Image.create :image => File.new(pa_bembo3_path)

image_pa_tinosell = Refinery::Image.create :image => File.new(pa_tinosell_path)
image_pa_tinosell2 = Refinery::Image.create :image => File.new(pa_tinosell2_path)

image_pa_fajol = Refinery::Image.create :image => File.new(pa_fajol_path)
image_pa_fajol2 = Refinery::Image.create :image => File.new(pa_fajol2_path)
image_pa_fajol3 = Refinery::Image.create :image => File.new(pa_fajol3_path)

# Added by Refinery CMS Breads extension
Refinery::Breads::Engine.load_seed

breads_page = Refinery::Page.find_by(:menu_match => "^/breads.*$")
raise "Error, there should be a breads page! See seeds.rb" if breads_page == nil

forn_page = Refinery::Page.find_by!(:title => "Backery")
forn_page.update!( :children => [breads_page] )
forn_page.translations.create!( { :locale => "es", 
                                  :title => "Panes", 
                                  :meta_description => META_DESCRIPTION,
:browser_title => BROWSER_TITLE } )
forn_page.translations.create!( { :locale => "ca", 
                                  :title => "Pans", 
                                  :meta_description => META_DESCRIPTION,
:browser_title => BROWSER_TITLE } )

breads_page.update!( :title => "Breads" )
breads_page.translations.create!( { :locale => "es", 
                                    :title => "Panes", 
                                    :meta_description => META_DESCRIPTION, 
                                    :browser_title => BROWSER_TITLE } )
breads_page.translations.create!( { :locale => "ca", 
                                    :title => "Pans",
                                    :meta_description => META_DESCRIPTION, 
                                    :browser_title => BROWSER_TITLE } )

panologia_page = forn_page.children.create!( :title => 'Panologia',
                                             :show_in_menu => true,
                                             :deletable => true )

panologia_page.translations.create!( { :locale => "es", 
                                       :title => "Panologia",
                                       :meta_description => META_DESCRIPTION, 
                                       :browser_title => BROWSER_TITLE } )
panologia_page.translations.create!( { :locale => "ca", 
                                       :title => "Panologia",
                                       :meta_description => META_DESCRIPTION, 
                                       :browser_title => BROWSER_TITLE } )

panologia_body_part = panologia_page.parts.create!( { :title => "Body", 
                                                      :body => "<p>Entres a les fosques i encens..., només una mica de llum... És agradable començar la jornada amb aquest silenci i aquesta aroma de l'última fornada i del pa fermentant... són les dues de la matinada.
                                                                El treball avança sense pressa, però sense pausa: comprovem els pans que ja estan esperant el seu torn per entrar al forn, formem les coques, encenem i controlem el foc, vigilem la rebosteria...
                                                                A poc a poc acabem tasques, col·loquem pans en cistells i lleixes, però alhora comencem de nou la massa mare i les masses per al següent torn, l'obrador no para.</p>
                                                               <p>Quan ens pregunten per què és diferent el nostre pa, sempre hi ha uns segons de silenci... Per on començo? El mateix em passa ara davant del paper... Fa dies em van demanar que expliqués 'el pa', el pa de la Fogaina, allò que té de diferent o d'important, del nostre treball diari ... No és que fem una cosa extraordinària, fora del que és normal, només fem pa, però potser si que cal deixar clar quin és el camí que hem decidit prendre, com treballem, perquè els que us acosteu a La Fogaina entengueu una mica millor què esteu comprant.</p>
                                                               <p>De cada punt que tractaré d'explicar a continuació se'n podria escriure un llibre (o uns quants), però intentarem resumir cada un d'aquests 'pilars' sobre els quals se sosté la filosofia del treball a La Fogaina.</p>
                                                               <h3>Farines i mòltes</h3>
                                                               <p>El gra del cereal es compon de tres parts: segó, midó i germen. En el midó hi ha les proteïnes: el gluten, és la part blanca. El segó és la part exterior, la fibra, i el germen és la part interior, plena de vida, on trobem vitamines i minerals. Consumit en la seva totalitat és un aliment bàsic en la nostra dieta que ens aporta importants propietats.
                                                                La humanitat fa milers d'anys que consumim les tres parts del gra, però des de fa poc més de 50 anys el consum de farina blanca -industrial, refinada- s'ha convertit en un dels ingredients més consumits en el dia a dia de la majoria de famílies. Aquestes farines industrials blanquíssimes, que es produeixen amb els moderns molins de cilindres, no contenen ni segó ni germen. Certament, sembla que la malaltia celíaca i les intoleràncies, en són el resultat. En canvi, els molins de pedra, per la seva forma de moldre el gra, produeixen una farina amb un alt percentatge de nutrients, i per bé que, després, aquesta farina la passin per uns sedassos per aconseguir una farina menys integral, sempre contindrà part del segó i del germen. És per això que els nostres pans 'blancs' són d'un color cremós.
                                                                Després també hi ha les diferents varietats de blats, algunes d'antigues, que s'han aconseguit conservar fins a l'actualitat, varietats com la famosa espelta, el kamut o blat del cor, o algunes més locals com la xeixa.
                                                                Quan consumim aquestes varietats, ecològiques, i de molins de pedra, no només ens aporten salut, sinó que a més a més contribuïm a la protecció del medi ambient, a la conservació de llavors i a la riquesa de la biodiversitat i a la sobirania alimentària.</p>
                                                               <h3>Massa mare</h3>
                                                               <p>La massa mare natural és un cultiu salvatge i espontani de llevats i de bacteris en base a farina i aigua. És la manera ancestral de llevar les masses, amb l'afegit del valor cultural que té crear la teva pròpia massa mare i guardar-la fins i tot per a tota la teva vida (i potser deixar-la en herència als teus néts!). És l'ànima d'una fleca, una més a l'obrador, la qual cal entendre-la, cuidar-la, alimentar-la, conservar-la, gairebé podríem dir que és una especialitat dins del món del forn de pa. La massa mare ens aportarà al pa conservació, sabor, aroma, una millor digestió... i aquest punt d'acidesa tan particular. És important que no confonguem la massa mare natural amb l'anomendada massa vella, una part de la massa de pa que es conserva del dia anterior.</p> 
                                                               <h3>Fermentació</h3>
                                                               <p>Es tracta de treure el màxim sabor del cereal. Crec que aquesta frase la vaig escoltar per primera vegada de la boca de Dan Lepard, mestre forner, i la veritat és que em va fer pensar. Està bé afegir a un pa llavors, fruits secs i el que ens passi pel cap, per fer d'un producte quotidià un producte més especial a la taula. Però, com a gran panarra, amb el que més gaudeixo és amb el pa, pa pa com diu un molt bon amic, ja sigui de blat o de sègol. M'agrada doncs, que la massa per si sola doni com a resultat un pa amb gust a cereal i a fermentació. Per aconseguir això és fonamental no escurçar els temps de fermentació i si pot ser allargar-los el màxim possible. D'aquesta manera, a més d'extreure tot el sabor a cereal, també n'augmentem la conservació i, molt important, la bona digestió del pa.</p>
                                                               <h3>Forn</h3>
                                                               <p>El nostre forn és un forn de llenya de foc directe, i això vol dir que quan els troncs cremen, la llengua de foc recorre tot l'interior del forn, on després es couran: primer les coques, després el pa i, finalment, la rebosteria. Antigament (i actualment en altres països com el Marroc) el de flequer i el de forner eren oficis diferents. Encara que podria ser que una persona dominés ambdues tècniques, en principi eren treballs diferents. De fet, abans, només existien forns de llenya, i això suposava un treball afegit, basat en l'atenció i un sisè sentit: la dificultat diària de fer coincidir el moment òptim de temperatura del forn amb el del punt idoni de fermentació de les masses. En aquest sentit, el nostre forn de llenya dóna al pa un toc especial gràcies a la seva solera de peces de fang que transmet la calor de forma gradual, amb el valor afegit que utilitzem una energia més adient al lloc on vivim.</p>
                                                               <p>Aquests quatre punts són els pilars sobre els quals es basa el treball, el mètode i la filosofia del pa de La Fogaina, els quals ens exigeixen donar el màxim cada dia per aconseguir una regularitat que acceptem com un repte diari, un procés d'aprenentatge continu. És un camí dret, sense dreceres que posin en dubte la qualitat del nostre producte. Sabem amb quina matèria primera treballem, i amb quin mètode creiem, perquè respectem el nostre ofici.</p>
                                                               <p><a href='/en'>Back to home</a></p>" } )

panologia_body_part.translations.create!( { :locale => "es", 
                                            :body => "<p>Entras a oscuras y enciendes ..., sólo un poco de luz ... Es agradable empezar la jornada con ese silencio y ese aroma de la última hornada y del pan fermentando ... son las dos de la madrugada.
                                                      El trabajo avanza sin prisa, pero sin pausa: comprobamos los panes que ya están esperando su turno para entrar en el horno, formamos las tortas, encendemos y controlamos el fuego, vigilamos la repostería ...
                                                      Poco a poco acabamos tareas, colocamos panes en cestos y estantes, pero a la vez empezamos de nuevo la masa madre y las masas para el siguiente turno, el obrador no para. </p>
                                                      <p> Cuando nos preguntan por qué es diferente el pan, siempre hay unos segundos de silencio ... ¿Por dónde empiezo? Lo mismo me pasa ahora ante el papel ... Hace días me pidieron que explicara 'el pan', el pan de la Fogaina, lo que tiene de diferente o de importante, de nuestro trabajo diario ... No es que hacemos algo extraordinario, fuera de lo normal, sólo hacemos pan, pero quizás si que hay que dejar claro cuál es el camino que hemos decidido tomar, como trabajamos, porque los que se acerque a La Fogaina entendáis un poco mejor que va a comprar. < / p>
                                                      <p> De cada punto que trataré de explicar a continuación se podría escribir un libro (o varios), pero intentaremos resumir cada uno de estos 'pilares' sobre los que se sostiene la filosofía del trabajo en La Fogaina. </p>
                                                      <h3> Harinas y molidos</h3>
                                                      <p> El grano del cereal se compone de tres partes: salvado, almidón y germen. En el almidón están las proteínas: el gluten, es la parte blanca. El salvado es la parte exterior, la fibra, y el germen es la parte interior, llena de vida, donde encontramos vitaminas y minerales. Consumido en su totalidad es un alimento básico en nuestra dieta que nos aporta importantes propiedades.
                                                      La humanidad hace miles de años que consumimos las tres partes del grano, pero desde hace poco más de 50 años el consumo de harina blanca -industrial, refinada- ha convertido en uno de los ingredientes más consumidos en el día a día de la mayoría de familias. Estas harinas industriales blanquísimas, que se producen con los modernos molinos de cilindros, no contienen ni salvado ni germen. Ciertamente, parece que la enfermedad celíaca y las intolerancias, son el resultado. En cambio, los molinos de piedra, por su forma de moler el grano, producen una harina con un alto porcentaje de nutrientes, y aunque, después, esta harina la pasen por unos cedazos para conseguir una harina menos integral, siempre contendrá parte del salvado y del germen. Es por eso que nuestros panes 'blancos' son de un color cremoso.
                                                      Luego también están las diferentes variedades de trigos, algunas antiguas, que han logrado conservar hasta la actualidad, variedades como la famosa espelta, el kamut o trigo del corazón, o algunas más locales como la blando.
                                                      Cuando consumimos estas variedades, ecológicas, y de molinos de piedra, no sólo nos aportan salud, sino que además contribuimos a la protección del medio ambiente, a la conservación de semillas ya la riqueza de la biodiversidad ya la soberanía alimentaria. < / p>
                                                      <h3> Masa madre </h3>
                                                      <p> La masa madre natural es un cultivo salvaje y espontáneo de levaduras y de bacterias en base a harina y agua. Es la manera ancestral de quitar las masas, con el añadido del valor cultural que tiene crear tu propia masa madre y guardarla incluso para toda tu vida (y tal vez dejarla en herencia a tus nietos!) . Es el alma de una panadería, una más en el obrador, la cual hay que entenderla, cuidarla, alimentarla, conservarla, casi podríamos decir que es una especialidad dentro del mundo de la panadería. La masa madre nos aportará al pan conservación, sabor, aroma, una mejor digestión ... y este punto de acidez tan particular. Es importante que no confundamos la masa madre natural con el anomendada demasiado vieja, una parte de la masa de pan que se conserva del día anterior. </p>
                                                      <h3> Fermentación </h3>
                                                      <p> Se trata de sacar el máximo sabor del cereal. Creo que esta frase la escuché por primera vez de la boca de Dan Lepard, maestro panadero, y la verdad es que me hizo pensar. Está bien añadir a un pan semillas, frutos secos y lo que nos pase por la cabeza, para hacer de un producto cotidiano un producto más especial en la mesa. Pero, como gran panarra, con lo que más disfruto es con el pan, pan pan como dice un muy buen amigo, ya sea de trigo o de centeno. Me gusta tanto, que la masa por sí sola dé como resultado un pan con sabor a cereal y en fermentación. Para lograr esto es fundamental no acortar los tiempos de fermentación y si puede ser alargar lo máximo posible. De este modo, además de extraer todo el sabor a cereal, también aumentamos la conservación y, muy importante, la buena digestión del pan. </p>
                                                      <h3> Horno </h3>
                                                      <p> Nuestro horno es un horno de leña de fuego directo, y esto quiere decir que cuando los troncos queman, la lengua de fuego recorre todo el interior del horno, donde después se cocerán: primero las tortas, después el pan y finalmente, la repostería. Antiguamente (y actualmente en otros países como Marruecos) el de panadero y el de panadero eran oficios diferentes. Aunque podría ser que una persona dominara ambas técnicas, en principio eran trabajos diferentes. De hecho, antes, sólo existían hornos de leña, lo que suponía un trabajo añadido, basado en la atención y un sexto sentido: la dificultad diaria de hacer coincidir el momento óptimo de temperatura del horno con el del punto idóneo de fermentación de las masas. En este sentido, nuestro horno de leña da al pan un toque especial gracias a su solera de piezas de barro que transmite el calor de forma gradual, con el valor añadido que utilizamos una energía más adecuada al lugar donde vivimos. </ P >
                                                      <p> Estos cuatro puntos son los pilares sobre los que se basa el trabajo, el método y la filosofía del pan de La Fogaina, los cuales nos exigen dar el máximo cada día para conseguir una regularidad que aceptamos como un reto diario, un proceso de aprendizaje continuo. Es un camino derecho, sin atajos que pongan en duda la calidad de nuestro producto. Sabemos con qué materia prima trabajamos, y con qué método creemos, porque respetamos nuestro oficio. </p>
                                                      <p> <a href='/es'>Volver al inicio</a> </p>" } )
panologia_body_part.translations.create!( { :locale => "ca", 
                                            :body => "<p>Entres a les fosques i encens..., només una mica de llum... És agradable començar la jornada amb aquest silenci i aquesta aroma de l'última fornada i del pa fermentant... són les dues de la matinada.
                                                      El treball avança sense pressa, però sense pausa: comprovem els pans que ja estan esperant el seu torn per entrar al forn, formem les coques, encenem i controlem el foc, vigilem la rebosteria...
                                                      A poc a poc acabem tasques, col·loquem pans en cistells i lleixes, però alhora comencem de nou la massa mare i les masses per al següent torn, l'obrador no para.</p>
                                                     <p>Quan ens pregunten per què és diferent el nostre pa, sempre hi ha uns segons de silenci... Per on començo? El mateix em passa ara davant del paper... Fa dies em van demanar que expliqués 'el pa', el pa de la Fogaina, allò que té de diferent o d'important, del nostre treball diari ... No és que fem una cosa extraordinària, fora del que és normal, només fem pa, però potser si que cal deixar clar quin és el camí que hem decidit prendre, com treballem, perquè els que us acosteu a La Fogaina entengueu una mica millor què esteu comprant.</p>
                                                     <p>De cada punt que tractaré d'explicar a continuació se'n podria escriure un llibre (o uns quants), però intentarem resumir cada un d'aquests 'pilars' sobre els quals se sosté la filosofia del treball a La Fogaina.</p>
                                                     <h3>Farines i mòltes</h3>
                                                     <p>El gra del cereal es compon de tres parts: segó, midó i germen. En el midó hi ha les proteïnes: el gluten, és la part blanca. El segó és la part exterior, la fibra, i el germen és la part interior, plena de vida, on trobem vitamines i minerals. Consumit en la seva totalitat és un aliment bàsic en la nostra dieta que ens aporta importants propietats.
                                                      La humanitat fa milers d'anys que consumim les tres parts del gra, però des de fa poc més de 50 anys el consum de farina blanca -industrial, refinada- s'ha convertit en un dels ingredients més consumits en el dia a dia de la majoria de famílies. Aquestes farines industrials blanquíssimes, que es produeixen amb els moderns molins de cilindres, no contenen ni segó ni germen. Certament, sembla que la malaltia celíaca i les intoleràncies, en són el resultat. En canvi, els molins de pedra, per la seva forma de moldre el gra, produeixen una farina amb un alt percentatge de nutrients, i per bé que, després, aquesta farina la passin per uns sedassos per aconseguir una farina menys integral, sempre contindrà part del segó i del germen. És per això que els nostres pans 'blancs' són d'un color cremós.
                                                      Després també hi ha les diferents varietats de blats, algunes d'antigues, que s'han aconseguit conservar fins a l'actualitat, varietats com la famosa espelta, el kamut o blat del cor, o algunes més locals com la xeixa.
                                                      Quan consumim aquestes varietats, ecològiques, i de molins de pedra, no només ens aporten salut, sinó que a més a més contribuïm a la protecció del medi ambient, a la conservació de llavors i a la riquesa de la biodiversitat i a la sobirania alimentària.</p>
                                                     <h3>Massa mare</h3>
                                                     <p>La massa mare natural és un cultiu salvatge i espontani de llevats i de bacteris en base a farina i aigua. És la manera ancestral de llevar les masses, amb l'afegit del valor cultural que té crear la teva pròpia massa mare i guardar-la fins i tot per a tota la teva vida (i potser deixar-la en herència als teus néts!). És l'ànima d'una fleca, una més a l'obrador, la qual cal entendre-la, cuidar-la, alimentar-la, conservar-la, gairebé podríem dir que és una especialitat dins del món del forn de pa. La massa mare ens aportarà al pa conservació, sabor, aroma, una millor digestió... i aquest punt d'acidesa tan particular. És important que no confonguem la massa mare natural amb l'anomendada massa vella, una part de la massa de pa que es conserva del dia anterior.</p> 
                                                     <h3>Fermentació</h3>
                                                     <p>Es tracta de treure el màxim sabor del cereal. Crec que aquesta frase la vaig escoltar per primera vegada de la boca de Dan Lepard, mestre forner, i la veritat és que em va fer pensar. Està bé afegir a un pa llavors, fruits secs i el que ens passi pel cap, per fer d'un producte quotidià un producte més especial a la taula. Però, com a gran panarra, amb el que més gaudeixo és amb el pa, pa pa com diu un molt bon amic, ja sigui de blat o de sègol. M'agrada doncs, que la massa per si sola doni com a resultat un pa amb gust a cereal i a fermentació. Per aconseguir això és fonamental no escurçar els temps de fermentació i si pot ser allargar-los el màxim possible. D'aquesta manera, a més d'extreure tot el sabor a cereal, també n'augmentem la conservació i, molt important, la bona digestió del pa.</p>
                                                     <h3>Forn</h3>
                                                     <p>El nostre forn és un forn de llenya de foc directe, i això vol dir que quan els troncs cremen, la llengua de foc recorre tot l'interior del forn, on després es couran: primer les coques, després el pa i, finalment, la rebosteria. Antigament (i actualment en altres països com el Marroc) el de flequer i el de forner eren oficis diferents. Encara que podria ser que una persona dominés ambdues tècniques, en principi eren treballs diferents. De fet, abans, només existien forns de llenya, i això suposava un treball afegit, basat en l'atenció i un sisè sentit: la dificultat diària de fer coincidir el moment òptim de temperatura del forn amb el del punt idoni de fermentació de les masses. En aquest sentit, el nostre forn de llenya dóna al pa un toc especial gràcies a la seva solera de peces de fang que transmet la calor de forma gradual, amb el valor afegit que utilitzem una energia més adient al lloc on vivim.</p>
                                                     <p>Aquests quatre punts són els pilars sobre els quals es basa el treball, el mètode i la filosofia del pa de La Fogaina, els quals ens exigeixen donar el màxim cada dia per aconseguir una regularitat que acceptem com un repte diari, un procés d'aprenentatge continu. És un camí dret, sense dreceres que posin en dubte la qualitat del nostre producte. Sabem amb quina matèria primera treballem, i amb quin mètode creiem, perquè respectem el nostre ofici.</p>
                                                     <p><a href='/ca'>Tornar a l'inici</a></p>" } )


############### Ahora la pagina hija de contacte llamada "On mes trobar-nos?"  #################

on_trobarnos_page = Refinery::Page.find_by(:title => "Where are we?")

raise "Error, there should be a 'Contact' page! See seeds.rb" if on_trobarnos_page == nil

contact_page = Refinery::Page.create!( { :show_in_menu => true,
                          :deletable => true,
                          :view_template => "on_som",
                          :title => "Contact" } )

contact_page.translations.create!( { :locale => "es", 
                                     :title => "Contacto",
                                     :meta_description => META_DESCRIPTION, 
                                    :browser_title => BROWSER_TITLE } )
contact_page.translations.create!( { :locale => "ca", 
                                     :title => "Contacte",
                                     :meta_description => META_DESCRIPTION, 
                                    :browser_title => BROWSER_TITLE } )


contact_page.update!( :children => [on_trobarnos_page] )

on_mes_trobarnos_page = contact_page.children.create!( :title => 'Where else to find us?',
                                               :show_in_menu => true,
                                               :deletable => true )

on_mes_trobarnos_page.translations.create!( { :locale => "es", 
                                              :title => "Dónde más encontrarnos?",
                                              :meta_description => META_DESCRIPTION, 
                                              :browser_title => BROWSER_TITLE } )
on_mes_trobarnos_page.translations.create!( { :locale => "ca", 
                                              :title => "On més trobar-nos?",
                                              :meta_description => META_DESCRIPTION, 
                                              :browser_title => BROWSER_TITLE } )

on_mes_trobarnos_body_part = on_mes_trobarnos_page.parts.create!( 
  { :title => "Body", 
    :body => "<p>You can find us ...</p>" } )

on_mes_trobarnos_body_part.translations.create!( { 
  :locale => "es", 
  :body => "<p>Podéis encontrarnos en:
              <ul>
                <li>Cooperativa La Xicoina</li>
                <li><a href=\"http://cooperativarauta.blogspot.com.es/\" target=\"_blank\">Cooperativa La Rauta</a></li>
                <li><a href=\"https://www.nuriasocial.org\" target=\"_blank\">Cantina Núria Social</a></li>   
                <li>Aliança RESTAURANT</li> 
              </ul>
            </p>" } )

on_mes_trobarnos_body_part.translations.create!( { 
  :locale => "ca", 
  :body => "<p>
              Podeu trobar alguns dels nostres productes a:
              <ul>
                <li>Cooperativa La Xicoina</li>
                <li><a href=\"http://cooperativarauta.blogspot.com.es/\" target=\"_blank\">Cooperativa La Rauta</a></li>
                <li><a href=\"https://www.nuriasocial.org\" target=\"_blank\">Cantina Núria Social</a></li>   
                <li>Aliança RESTAURANT</li> 
              </ul>
            </p>" } )

############################################                                                     

panes = [ 
          { 
            :name_ca => "La Soca", 
            :name_es => "La Soca",
            :name_en => "La Soca",  
            :description_ca => "<p>Un pa fet amb una barreja de farines integrals de varietats antigues de blat (espelta, kamut, xeixa ...), format de motlle i fet amb massa mare. Hem aconseguit aquest pa gràcies a la tècnica del Soaker: grans de blat i d'arròs integral cuits que aporten un extra d'esponjositat i humitat a la molla. Adquiriu sabor i salut a un preu d'escàndol!</p>",
            :description_es => "<p>Un pan de mezcla de harinas integrales de variedades antiguas de trigo (espelta, kamut, xeixa...), formato de molde y hecho con Masa Madre, no tiene porque ser un pan denso y ácido. Hemos trabajado y lo conseguimos gracias a un Soaker, granos de trigo y arroz integral cocidos que aportan ese extra de esponjosidad y humedad de la miga. Estas comprando sabor y salud a un precio de escandalo!</p>",
            :description_en => "<p>Un pan de mezcla de harinas integrales de variedades antiguas de trigo (espelta, kamut, xeixa...), formato de molde y hecho con Masa Madre, no tiene porque ser un pan denso y ácido. Hemos trabajado y lo conseguimos gracias a un Soaker, granos de trigo y arroz integral cocidos que aportan ese extra de esponjosidad y humedad de la miga. Estas comprando sabor y salud a un precio de escandalo!</p>",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday],
            #:price => 3,
            :price => nil,
            :photo => image_soca,
            :photo2 => image_soca2,
            :photo3 => image_soca3
          },
          { :name_ca => "Pa de pagés", 
            :name_es => "Pan de pagés",
            :name_en => "Pa de pagés",  
            :description_ca => "<p>Sens dubte el pa que més ens va costar definir-ne la fórmula. Sembla mentida: un pa tan senzill a primera vista i, precisament, per això, ens va donar molta feina, perquè volíem fer un pa senzill que no fos vulgar. Farina semiblanca de molí de pedra i una massa mare natural, que el doten d'una ànima làctica i suau, fugint del què és insípid. El forn de llenya de solera de fang és el company ideal per aconseguir una bona fogassa. Pa de pagés de 600gr - 2,10€, Pa de pagés 1Kg - 3,20€</p>",
            :description_es => "<p>Sin duda el pan que más nos costó definir la formula. Parece mentira siendo un pan tan sencillo a simple vista, y es por ese mismo motivo, el hecho de no querer que un pan sencillo fuese vulgar. Harina semiblanca de molino de piedra y una masa madre natural le dotan de un alma láctica y suave, huyendo de lo insípido. El horno de leña de suela de barro es el compañero ideal para conseguir una buena hogaza. Pan de pagés de 600gr - 2,10€, Pan de pagés 1Kg - 3,20€</p>",
            :description_en => "<p>Sin duda el pan que más nos costó definir la formula. Parece mentira siendo un pan tan sencillo a simple vista, y es por ese mismo motivo, el hecho de no querer que un pan sencillo fuese vulgar. Harina semiblanca de molino de piedra y una masa madre natural le dotan de un alma láctica y suave, huyendo de lo insípido. El horno de leña de suela de barro es el compañero ideal para conseguir una buena hogaza. Pan de pagés de 600gr - 2,10€, Pan de pagés 1Kg - 3,20€</p>",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday],
            :price => nil,
            :photo => image_pa_de_pages,
            :photo2 => image_pa_de_pages2,
            :photo3 => image_pa_de_pages3
          },
          { :name_ca => "Rústic", 
            :name_es => "Rústico",
            :name_en => "Rustic",  
            :description_ca => "<p>Motivats per aconseguir una fogassa similar al pa de pagès, però amb la intenció de proveir-lo de més fibra i sabor, i un millor alveolat, sense ajuda de llevat, només amb una massa mare jove, i afegint-t'hi farines integrals de blat i de sègol. Vam haver d'anar pujant la hidratació de la massa, que després es va convertir tècnicament en el repte per als forners nous de la Fogaina. El forn de llenya a gairebé 250 ºC i tot el que podem d'humitat són l'últim esglaó per aconseguir una bonica i daurada fogassa.</p>",
            :description_es => "<p>Motivados por conseguir una hogaza similar al pan de payès, pero con la intención de dotar de más fibra y sabor, y una mejor alveolatura, sin ayuda de levadura, solamente con una masa madre joven, y añadiendo harinas integrales de trigo y centeno. Tuvimos que ir subiendo la hidratación de la masa, este luego se convirtió técnicamente en reto para los panaderos nuevos en la Fogaina. El horno de leña a casi 250ºC y todo lo que podemos de humedad son el último peldaño para conseguir un bonito y dorado hogazón.</p>",
            :description_en => "<p>Motivados por conseguir una hogaza similar al pan de payès, pero con la intención de dotar de más fibra y sabor, y una mejor alveolatura, sin ayuda de levadura, solamente con una masa madre joven, y añadiendo harinas integrales de trigo y centeno. Tuvimos que ir subiendo la hidratación de la masa, este luego se convirtió técnicamente en reto para los panaderos nuevos en la Fogaina. El horno de leña a casi 250ºC y todo lo que podemos de humedad son el último peldaño para conseguir un bonito y dorado hogazón.</p>",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday],
            #:price => 3,
            :price => nil,
            :photo => image_pa_rustic,
            :photo2 => image_pa_rustic2,
            :photo3 => image_pa_rustic3
          },
          { :name_ca => "Pigat", 
            :name_es => "Pigat",
            :name_en => "Pigat",  
            :description_ca => "<p>Agafem la massa del Rústic i hi afegim una barreja de llavors torrades i deixades en remull... Més gust, si és possible, a la nostra massa rústica!</p>",
            :description_es => "<p>Cogemos la masa del Rústic y añadimos una mezcla de semillas tostadas y dejadas en remojo... Más sabor si cabe a nuestra masa rústica!</p>",
            :description_en => "<p>Cogemos la masa del Rústic y añadimos una mezcla de semillas tostadas y dejadas en remojo... Más sabor si cabe a nuestra masa rústica!</p>",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday],
            #:price => 3.50,
            :price => nil,
            :photo => image_pa_pigat,
            :photo2 => image_pa_pigat2,
            :photo3 => image_pa_pigat3
          },
          { :name_ca => "Tinosell", 
            :name_es => "Tinosell",
            :name_en => "Tinosell",  
            :description_ca => "<p>I encara motivats per oferir més diversitat panarra a les nostres lleixes, ens vam treure de la màniga aquest panot ideal per a esmorzars i berenars, o per combinar si vols amb un bon tast de formatges. A la nostra massa rústica li afegim fruita seca i la fiquem dins d'un motlle. L'oli de les anous tenyeix d'un preciós morat la molla d'aquest pa tan especial.</p>",
            :description_es => "<p>Y aún motivados por ofrecer más diversidad panarra en nuestras estanterías, nos sacamos de la manga este panazo ideal para desayunos y meriendas, o para combinar si quieres con una buena cata de quesos. A nuestra masa rústica le añadimos frutos secos y lo metemos dentro de un molde. El aceite de las nueces tiñe de un precioso morado la miga de este pan tan especial.</p>",
            :description_en => "<p>Y aún motivados por ofrecer más diversidad panarra en nuestras estanterías, nos sacamos de la manga este panazo ideal para desayunos y meriendas, o para combinar si quieres con una buena cata de quesos. A nuestra masa rústica le añadimos frutos secos y lo metemos dentro de un molde. El aceite de las nueces tiñe de un precioso morado la miga de este pan tan especial.</p>",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday],
            #:price => 4,
            :price => nil,
            :photo => image_pa_tinosell,
            :photo2 => image_pa_tinosell2,
            :photo3 => nil
          },
          { :name_ca => "Espelta", 
            :name_es => "Espelta",
            :name_en => "Espelta",  
            :description_ca => "<p>Per als esportistes, puristes, integristes, espeltatians... No hi ha millor plaer que un pa 100 % espelta integral, amb la seva dosi de massa mare d'espelta, i amenitzat amb unes pipes de gira-sol torrades. Molt bon gust i llarga conservació.</p>",
            :description_es => "<p>Para los deportistas, puristas, integristas, espeltatianos... No hay mejor placer que un pan 100% espelta integral, con su dosis de masa madre de espelta, y amenizado con unas pipas de girasol tostadas. Muy buen sabor y larga conservación.</p>",
            :description_en => "<p>Para los deportistas, puristas, integristas, espeltatianos... No hay mejor placer que un pan 100% espelta integral, con su dosis de masa madre de espelta, y amenizado con unas pipas de girasol tostadas. Muy buen sabor y larga conservación.</p>",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday],
            #:price => 4.30,
            :price => nil,
            :photo => image_pa_espelta,
            :photo2 => image_pa_espelta2,
            :photo3 => image_pa_espelta3
          },
          { :name_ca => "Coca de forner", 
            :name_es => "Coca de forner",
            :name_en => "Coca de forner",  
            :description_ca => "<p>Una fleca amb un bon forn de llenya no es pot permetre no coure unes coques de forner. El motiu és el ritme de cocció que ens ofereix el nostre forn. Quan l'escalfem, la temperatura puja tant que abans de palejar el pa podem enfornar unes coques a gairebé 300 ºC quan encara estan vives les brases. El procés de format, estirat i repòs és gradual durant la matinada, fins a l'últim estirat a la mateixa pala, un bon raig d'oli d'oliva, empolsinada de sucre i cap a dins! Quan surt, una ruixada amb anís per cristal·litzar el sucre... No us podeu imaginar la fragància que omple tot l'obrador.</p>",
            :description_es => "<p>Una panaderia con un buen horno de leña no se puede permitir no cocer unas Cocas de Forner. El motivo es el ritmo de cocción que nos ofrece nuestro horno. Al calentarlo, la temperatura sube tanto que antes de palear el pan podemos hornear unas cocas a casi 300ºC cuando aún estan vivas las brasas. El proceso de formado,estirado y reposo es paulatino durante la madrugada, hasta el último estirado en la misma pala, buen chorro de aceite de oliva y espolvoreo de azucar y adentro. Al salir, sin perder tiempo una rociada con anis para cristalizar el azucar... No os podeis imaginar la fragancia que llena todo el obrador.</p>",
            :description_en => "<p>Una panaderia con un buen horno de leña no se puede permitir no cocer unas Cocas de Forner. El motivo es el ritmo de cocción que nos ofrece nuestro horno. Al calentarlo, la temperatura sube tanto que antes de palear el pan podemos hornear unas cocas a casi 300ºC cuando aún estan vivas las brasas. El proceso de formado,estirado y reposo es paulatino durante la madrugada, hasta el último estirado en la misma pala, buen chorro de aceite de oliva y espolvoreo de azucar y adentro. Al salir, sin perder tiempo una rociada con anis para cristalizar el azucar... No os podeis imaginar la fragancia que llena todo el obrador.</p>",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday],
            #:price => 3.10,
            :price => nil,
            :photo => image_coca_forner,
            :photo2 => image_coca_forner2,
            :photo3 => image_coca_forner3
          },
          { :name_ca => "Pa de coca", 
            :name_es => "Pa de coca",
            :name_en => "Pa de coca",  
            :description_ca => "<p>Pel tipus de forn i l'organització ens és difícil oferir barres tradicionals. Així que aquest és el nostre producte que més s'adapta a l'hora de l'entrepà. És una mena de xapata allargada, alveolada i de crosta fina. El toc d'oli d'oliva i el de gira-sol, tots dos d'altíssima qualitat, li donen un sabor i una textura particulars.</p>",
            :description_es => "<p>Por temas de tipo de horno y organización, nos es muy difícil ofrecer unas barras. Así que este es nuestro producto que más se adapta a la hora del bocata. Viene a ser un tipo de chapata alargada, alveolada y de corteza fina. El toque de aceite de oliva y girasol, ambos de altisima calidad, le da un sabor y textura particular.</p>",
            :description_en => "<p>Por temas de tipo de horno y organización, nos es muy difícil ofrecer unas barras. Así que este es nuestro producto que más se adapta a la hora del bocata. Viene a ser un tipo de chapata alargada, alveolada y de corteza fina. El toque de aceite de oliva y girasol, ambos de altisima calidad, le da un sabor y textura particular.</p>",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday],
            #:price => 2.60,
            :price => nil,
            :photo => image_pa_de_coca,
            :photo2 => image_pa_de_coca2,
            :photo3 => image_pa_de_coca3
          },
          { :name_ca => "Brot Negre", 
            :name_es => "Brot Negre",
            :name_en => "Brot Negre",  
            :description_ca => "<p>Si tenim un pa que desvetlla passions confrontades aquest és el Brot. Un panot 100% de sègol integral que no deixa indiferent. La cultura del sègol a la Mediterrània és escassa, per això li donem aquesta oportunitat, a més de tastar una cosa ben diferent i aromàtica, menjareu pura salut i tindreu a les vostres mans un pa que dura molts dies. Acompanyeu-lo de formatges forts, anxoves, patés, mantega o melmelada amarga ...</p>",
            :description_es => "<p>Si tenemos un pan que despierte pasiones encontradas este es el Brot. Un panazo 100% de centeno integral que no deja indiferente. Es cierto que la poca cultura de centeno que tenemos en el mediterráneo hace de este pan para algunos un incomprendido, pero si le das una oportunidad, además de degustar algo diferente i aromático estarás comiendo pura salud y tendrás en tus manos un pan que dura muchos días. Acompáñalo de quesos fuertes, anchoas, patés, mantequilla y mermelada amarga ...</p>",
            :description_en => "<p>Si tenemos un pan que despierte pasiones encontradas este es el Brot. Un panazo 100% de centeno integral que no deja indiferente. Es cierto que la poca cultura de centeno que tenemos en el mediterráneo hace de este pan para algunos un incomprendido, pero si le das una oportunidad, además de degustar algo diferente i aromático estarás comiendo pura salud y tendrás en tus manos un pan que dura muchos días. Acompáñalo de quesos fuertes, anchoas, patés, mantequilla y mermelada amarga ...</p>",
            :available_days => [:thursday, :friday, :saturday],
            #:price => 4,
            :price => nil,
            :photo => image_brot_negre,
            :photo2 => image_brot_negre2,
            :photo3 => image_brot_negre3
          },
          { :name_ca => "Bembó", 
            :name_es => "Bembó",
            :name_en => "Bembó",  
            :description_ca => "<p>Per què hem de renunciar als pans de motllo blancs i esponjosos que ofereixen les marques industrials? Si a més aconseguim que siguin més bons i saludables ...</p>",
            :description_es => "<p>Porqué tenemos que renunciar a los panes de molde blancos i esponjosos que ofrecen las marcas industriales? Si además conseguimos que sean más buenos y saludables ...</p>",
            :description_en => "<p>Porqué tenemos que renunciar a los panes de molde blancos i esponjosos que ofrecen las marcas industriales? Si además conseguimos que sean más buenos y saludables ...</p>",
            :available_days => [:wednesday, :thursday],
            #:price => 4,
            :price => nil,
            :photo => image_pa_bembo,
            :photo2 => image_pa_bembo2,
            :photo3 => image_pa_bembo3
          },
          { :name_ca => "Fajol", 
            :name_es => "Fajol",
            :name_en => "Fajol",  
            :description_ca => "<p>Una mica obligats per la demanda, i limitats per les \"traces\", finalment ens vam decidir a fer un pa \"sense gluten\", que per les condicions del nostre obrador, ens impedeix de certificar-lo per a celíacs. La nostra intenció des del primer moment era aconseguir un molt bon pa sense gluten. Hem après unes quantes coses sobre mètodes i nous ingredients. Així que esperem estar a l'alçada i que el gaudiu.</p>",
            :description_es => "<p>Un poco obligados por la demanda, y limitados por las \“trazas\”, finalmente nos decidimos a hacer un pan \“sin gluten\” pero que por las condiciones de nuestro obrador, es imposible de certificar para celíacos. Nuestra intención desde el primer momento era conseguir un muy buen pan sin gluten. Hemos aprendido unas cuantas cosas sobre métodos y nuevos ingredientes. Así que esperamos estar a la altura y que lo disfrutéis.</p>",
            :description_en => "<p>Un poco obligados por la demanda, y limitados por las \“trazas\”, finalmente nos decidimos a hacer un pan \“sin gluten\” pero que por las condiciones de nuestro obrador, es imposible de certificar para celíacos. Nuestra intención desde el primer momento era conseguir un muy buen pan sin gluten. Hemos aprendido unas cuantas cosas sobre métodos y nuevos ingredientes. Así que esperamos estar a la altura y que lo disfrutéis.",
            :available_days => [:tuesday, :wednesday, :thursday, :friday, :saturday, :por_encargo],
            #:price => 6,
            :price => nil,
            :photo => image_pa_fajol,
            :photo2 => image_pa_fajol2,
            :photo3 => image_pa_fajol3
          }
        ]

panes.each do |pan_attr|
  pan = Refinery::Breads::Bread.create!( :name => pan_attr[:name_en], 
                                         :description => pan_attr[:description_en],
                                         :available_days => pan_attr[:available_days],
                                         :price => pan_attr[:price],
                                         :photo => pan_attr[:photo],
                                         :photo2 => pan_attr[:photo2],
                                         :photo3 => pan_attr[:photo3],
                                         :locale => "en" )

  pan.translations.create!( :refinery_bread_id => pan.id,
                            :locale => "ca",
                            :name => pan_attr[:name_ca],
                            :description => pan_attr[:description_ca] )

  pan.translations.create!( :refinery_bread_id => pan.id,
                            :locale => "es",
                            :name => pan_attr[:name_es],
                            :description => pan_attr[:description_es] )

end
# Added by Refinery CMS News engine
Refinery::News::Engine.load_seed


news_page = Refinery::Page.find_by(:menu_match => "^/news.*$")

raise "Error, there should be a news page! See seeds.rb" if news_page == nil

news_page.update!( :title => "Activities" )

news_page.translations.create!( { :locale => "es", 
                                  :title => "Actividades",
                                  :meta_description => META_DESCRIPTION, 
                                  :browser_title => BROWSER_TITLE } )
news_page.translations.create!( { :locale => "ca", 
                                  :title => "Activitats",
                                  :meta_description => META_DESCRIPTION, 
                                  :browser_title => BROWSER_TITLE } )

# Commented out news
if false

  oclot_path = "#{Rails.root.join('app/assets/images/news/fogaina_presentacio_600x450.jpg')}"
  espai_path = "#{Rails.root.join('app/assets/images/cafeteria/espai.jpg')}"
  cursos_cartell_path = "#{Rails.root.join('app/assets/images/cursos/cursos_cartell.jpg')}"

  # Images used in news
  image_oclot = Refinery::Image.create :image => File.new(oclot_path)
  image_espai= Refinery::Image.create :image => File.new(espai_path)
  image_cursos_cartell = Refinery::Image.create :image => File.new(cursos_cartell_path)

  noticias = [ 
    {
      title_ca: "La Fogaina-Oclot. Servei d'entrega ecològic", 
      title_en: "La Fogaina-Oclot. Organic delivery system.",
      title_es: "La Fogaina-Oclot. Servicio de entrega ecológico.",  
      body_ca: "<p>Desde la Fogaina voliem oferir un servei d'entrega dels nostres productes pels nostres clients de la vall d'en bas i olot, i finalment hem trobat la manera més acord amb la nostra filosofia de sostenibilitat i manera de fer, i és treballar al costat d' Oclot un servei de missatgeria a domicili ecològic (en bicicleta!!).</p>
             <p>Volem donar la millor qualitat dels nostres productes des d'el forn fins a la porta de casa.
             A partir d'ara ja podeu fer les vostres comandes a la pàgina web de OCLOT o trucant directament al telèfon de la nostra botiga: 646.879.062
             Salut, Pa i Pedals!!!</p>", 
      body_en: "<p>Desde la Fogaina voliem oferir un servei d'entrega dels nostres productes pels nostres clients de la vall d'en bas i olot, i finalment hem trobat la manera més acord amb la nostra filosofia de sostenibilitat i manera de fer, i és treballar al costat d' Oclot un servei de missatgeria a domicili ecològic (en bicicleta!!).</p>
             <p>Volem donar la millor qualitat dels nostres productes des d'el forn fins a la porta de casa.
             A partir d'ara ja podeu fer les vostres comandes a la pàgina web de OCLOT o trucant directament al telèfon de la nostra botiga: 646.879.062
             Salut, Pa i Pedals!!!</p>",
      body_es: "<p>Desde la Fogaina voliem oferir un servei d'entrega dels nostres productes pels nostres clients de la vall d'en bas i olot, i finalment hem trobat la manera més acord amb la nostra filosofia de sostenibilitat i manera de fer, i és treballar al costat d' Oclot un servei de missatgeria a domicili ecològic (en bicicleta!!).</p>
             <p>Volem donar la millor qualitat dels nostres productes des d'el forn fins a la porta de casa.
             A partir d'ara ja podeu fer les vostres comandes a la pàgina web de OCLOT o trucant directament al telèfon de la nostra botiga: 646.879.062
             Salut, Pa i Pedals!!!</p>",
      publish_date: DateTime.now,
      photo_id: image_oclot.id  
    },
    {
      title_ca: "Cursos de pa a la Fogaina febrer-abril 2015",
      title_en: "Bread Courses at la Fogaina february-april 2015",
      title_es: "Cursos de pan en la Fogaina febrero-abril 2015", 
      body_ca: "<p>Aquí teniu els cursos per aquests primers mesos del 2015. Ja feia temps que no preparàvem una de grossa, i ara ja amb forces després de les minivacances tornem amb moltes ganes!!</p>
             <p>Hem preparat 3 tipus de cursos d'un matí i 1 experiència de tot el dia, per apendre i gaudir del mon panarra i de la fantàstica ubicació de La Fogaina, al bell mig de la Vall d'en Bas.
             Mes info a la pestanya de 'cursos'.</p>", 
      body_en: "<p>Aquí teniu els cursos per aquests primers mesos del 2015. Ja feia temps que no preparàvem una de grossa, i ara ja amb forces després de les minivacances tornem amb moltes ganes!!</p>
             <p>Hem preparat 3 tipus de cursos d'un matí i 1 experiència de tot el dia, per apendre i gaudir del mon panarra i de la fantàstica ubicació de La Fogaina, al bell mig de la Vall d'en Bas.
             Mes info a la pestanya de 'cursos'.</p>", 
      body_es: "<p>Aquí teniu els cursos per aquests primers mesos del 2015. Ja feia temps que no preparàvem una de grossa, i ara ja amb forces després de les minivacances tornem amb moltes ganes!!</p>
             <p>Hem preparat 3 tipus de cursos d'un matí i 1 experiència de tot el dia, per apendre i gaudir del mon panarra i de la fantàstica ubicació de La Fogaina, al bell mig de la Vall d'en Bas.
             Mes info a la pestanya de 'cursos'.</p>", 
      publish_date: DateTime.now,
      photo_id: image_cursos_cartell.id  
    },
    {
      title_ca: "La Fogaina Pa i Cafè obre les portes",
      title_en: "La Fogaina Pa i Cafè opens its doors",
      title_es: "La Fogaina Pa i Cafè abre sus puertas", 
      body_ca: "<p>Ja hem inaugurat el nou espai de la Fogaina, es diu La Fogaina Pa i Cafè. Hem estat un parell de mesos superestresats i molt liats per poder tirar endavant aquest nou projecte, i aquesta vegada ens hem buscat uns socis lamardemacus, l'Emili i la Joana, i compartim de manera cooperativa, el funcionament del nou espai.</p>
             <p>La Fogaina, Pa i Cafè, l'hem obert a un petit local a Les Preses, a la Vall d'en Bas, només a 3 km de distancia d'on tenim l'obrador, així que cada dia de dimarts a dissabte (8:00 a 13:30, i 16:00 a 20:00) tenim productes recent fets al nostre forn de llenya, per que els acompanyeu amb un bon cafè o una cerveseta artesana i local.
             També hem ampliat la nostra oferta panarra, fem mes varietat mes dies a la setmana, i sobretot hem començat a fer mes dolços: Magdalenes, galetes, croissants, briox, coques etc.
             Si voleu mes info, cliqueu a la pestanyeta que posa Pa i Cafè mes amunt.
             I el pròxim dia 11 d'octubre fem una festeta d'apertura coincidint amb les festes del poble!!</p>", 
      body_en: "<p>Ja hem inaugurat el nou espai de la Fogaina, es diu La Fogaina Pa i Cafè. Hem estat un parell de mesos superestresats i molt liats per poder tirar endavant aquest nou projecte, i aquesta vegada ens hem buscat uns socis lamardemacus, l'Emili i la Joana, i compartim de manera cooperativa, el funcionament del nou espai.</p>
             <p>La Fogaina, Pa i Cafè, l'hem obert a un petit local a Les Preses, a la Vall d'en Bas, només a 3 km de distancia d'on tenim l'obrador, així que cada dia de dimarts a dissabte (8:00 a 13:30, i 16:00 a 20:00) tenim productes recent fets al nostre forn de llenya, per que els acompanyeu amb un bon cafè o una cerveseta artesana i local.
             També hem ampliat la nostra oferta panarra, fem mes varietat mes dies a la setmana, i sobretot hem començat a fer mes dolços: Magdalenes, galetes, croissants, briox, coques etc.
             Si voleu mes info, cliqueu a la pestanyeta que posa Pa i Cafè mes amunt.
             I el pròxim dia 11 d'octubre fem una festeta d'apertura coincidint amb les festes del poble!!</p>", 
      body_es: "<p>Ja hem inaugurat el nou espai de la Fogaina, es diu La Fogaina Pa i Cafè. Hem estat un parell de mesos superestresats i molt liats per poder tirar endavant aquest nou projecte, i aquesta vegada ens hem buscat uns socis lamardemacus, l'Emili i la Joana, i compartim de manera cooperativa, el funcionament del nou espai.</p>
             <p>La Fogaina, Pa i Cafè, l'hem obert a un petit local a Les Preses, a la Vall d'en Bas, només a 3 km de distancia d'on tenim l'obrador, així que cada dia de dimarts a dissabte (8:00 a 13:30, i 16:00 a 20:00) tenim productes recent fets al nostre forn de llenya, per que els acompanyeu amb un bon cafè o una cerveseta artesana i local.
             També hem ampliat la nostra oferta panarra, fem mes varietat mes dies a la setmana, i sobretot hem començat a fer mes dolços: Magdalenes, galetes, croissants, briox, coques etc.
             Si voleu mes info, cliqueu a la pestanyeta que posa Pa i Cafè mes amunt.
             I el pròxim dia 11 d'octubre fem una festeta d'apertura coincidint amb les festes del poble!!</p>", 
      publish_date: DateTime.now,
      photo_id: image_espai.id  
    },
    # {
    #   title_ca: "Festa panarra final de curs",
    #   title_en: "Panarra party end of the course",
    #   title_es: "Fiesta panarra final de curso", 
    #   body_ca: "<p>Ja queden pocs dies per la cel.lebració de la Festa Panarra que tindrà lloc al nostre Forn. Després d'un estiu molt mogut amb diferents cursos de pa, toca fer una mica de gresca.
    #             El dia senyalat: Diumenge 29 de septembre
    #             Hora: A partir de les 11:00h (mes o menys) i fins les 20:00 (mes o menys també)
    #             Qui pot venir: Tothom que li agradi el bon pa, la bona cervessa, la bona música... sempre amb respecte i \"saber estar\".
    #             Que s'ha de portar?: No es obligatori però podeu portar algo per compartir tipus menjar de primer plat (cosetes bones per vacil.lar jeje), o alguna beguda chupi, o algun postre requetechupi. I per descomptat bon humor i ganes de ballar si cal!!!.
    #             I pels panarras tindrem preparada una taula exclusiva només per pans. Així que podeu portar un pa fet a casa perque fem una bona degustació tothom (no serà concurs).
    #             Els músics podeu portar el vostre instrument (si es acústic) per acompanyar l'acordió la flauta travessera i el banjo que segur que estaràn.
    #             Que us trobareu?: Tindrem un parell de barrils de cervessa artesana de la bona. Una taula amb pica pica i menjars que portarem entre tots. Una barbacoa amb carn de la garrotxa. Música en directe folk... i bon pa!!</p>", 
    #   body_en: "<p>Ja queden pocs dies per la cel.lebració de la Festa Panarra que tindrà lloc al nostre Forn. Després d'un estiu molt mogut amb diferents cursos de pa, toca fer una mica de gresca.
    #             El dia senyalat: Diumenge 29 de septembre
    #             Hora: A partir de les 11:00h (mes o menys) i fins les 20:00 (mes o menys també)
    #             Qui pot venir: Tothom que li agradi el bon pa, la bona cervessa, la bona música... sempre amb respecte i \"saber estar\".
    #             Que s'ha de portar?: No es obligatori però podeu portar algo per compartir tipus menjar de primer plat (cosetes bones per vacil.lar jeje), o alguna beguda chupi, o algun postre requetechupi. I per descomptat bon humor i ganes de ballar si cal!!!.
    #             I pels panarras tindrem preparada una taula exclusiva només per pans. Així que podeu portar un pa fet a casa perque fem una bona degustació tothom (no serà concurs).
    #             Els músics podeu portar el vostre instrument (si es acústic) per acompanyar l'acordió la flauta travessera i el banjo que segur que estaràn.
    #             Que us trobareu?: Tindrem un parell de barrils de cervessa artesana de la bona. Una taula amb pica pica i menjars que portarem entre tots. Una barbacoa amb carn de la garrotxa. Música en directe folk... i bon pa!!</p>", 
    #   body_es: "<p>Ja queden pocs dies per la cel.lebració de la Festa Panarra que tindrà lloc al nostre Forn. Després d'un estiu molt mogut amb diferents cursos de pa, toca fer una mica de gresca.
    #             El dia senyalat: Diumenge 29 de septembre
    #             Hora: A partir de les 11:00h (mes o menys) i fins les 20:00 (mes o menys també)
    #             Qui pot venir: Tothom que li agradi el bon pa, la bona cervessa, la bona música... sempre amb respecte i \"saber estar\".
    #             Que s'ha de portar?: No es obligatori però podeu portar algo per compartir tipus menjar de primer plat (cosetes bones per vacil.lar jeje), o alguna beguda chupi, o algun postre requetechupi. I per descomptat bon humor i ganes de ballar si cal!!!.
    #             I pels panarras tindrem preparada una taula exclusiva només per pans. Així que podeu portar un pa fet a casa perque fem una bona degustació tothom (no serà concurs).
    #             Els músics podeu portar el vostre instrument (si es acústic) per acompanyar l'acordió la flauta travessera i el banjo que segur que estaràn.
    #             Que us trobareu?: Tindrem un parell de barrils de cervessa artesana de la bona. Una taula amb pica pica i menjars que portarem entre tots. Una barbacoa amb carn de la garrotxa. Música en directe folk... i bon pa!!</p>", 
    #   publish_date: DateTime.now,
    #   photo_id: nil 
    # },
    # {
    #   title_ca: "Curs rebosteria panadera",
    #   title_en: "Pastry course",
    #   title_es: "Curso reposteria panadera", 
    #   body_ca: "<p>Aún de calentón y ya con ganas de contaros como ha ido el curso de Reposteria Panadera con Chema de Forn Pedreres.
    #             Ha sido un curso intenso de todo el dia laborando en el obrador, lxs chicxs apuntadxs al curso se han aplicado pero bien bien.
    #             Chema nos tenia preparados una buena tanda de recetas a elaborar: Croissants (pequeños, grandes, xocolate, xoricillo...), magdalenas, coca de forner y coca de vidre.</p>", 
    #   body_en: "<p>Aún de calentón y ya con ganas de contaros como ha ido el curso de Reposteria Panadera con Chema de Forn Pedreres.
    #             Ha sido un curso intenso de todo el dia laborando en el obrador, lxs chicxs apuntadxs al curso se han aplicado pero bien bien.
    #             Chema nos tenia preparados una buena tanda de recetas a elaborar: Croissants (pequeños, grandes, xocolate, xoricillo...), magdalenas, coca de forner y coca de vidre.</p>", 
    #   body_es: "<p>Aún de calentón y ya con ganas de contaros como ha ido el curso de Reposteria Panadera con Chema de Forn Pedreres.
    #             Ha sido un curso intenso de todo el dia laborando en el obrador, lxs chicxs apuntadxs al curso se han aplicado pero bien bien.
    #             Chema nos tenia preparados una buena tanda de recetas a elaborar: Croissants (pequeños, grandes, xocolate, xoricillo...), magdalenas, coca de forner y coca de vidre.</p>", 
    #   publish_date: DateTime.now,
    #   photo_id: nil 
    # }
  ]

  noticias.each do |noticia_attr|

    noticia = Refinery::News::Item.create!( 
      locale: "en", 
      title: noticia_attr[:title_en], 
      body: noticia_attr[:body_en], 
      publish_date: noticia_attr[:publish_date],
      photo_id: noticia_attr[:photo_id] )

    noticia.translations.create!( { :refinery_news_item_id => noticia.id,
                                    :locale => "ca",
                                    :title => noticia_attr[:title_ca], 
                                    :body => noticia_attr[:body_ca] } )

    noticia.translations.create!( { :refinery_news_item_id => noticia.id,
                                    :locale => "es",
                                    :title => noticia_attr[:title_es],
                                    :body => noticia_attr[:body_es] } )
  end

end # Commented out news


# Added by Refinery CMS CafeteriaCategories extension
Refinery::CafeteriaCategories::Engine.load_seed

cafeteria_page = Refinery::Page.find_by(:title => "Cafeteria")

raise "Error, there should be a cafeteria page! See seeds.rb" if cafeteria_page == nil

cafeteria_page.translations.create!( { :locale => "es", 
                                       :title => "Cafetería",
                                       :meta_description => META_DESCRIPTION, 
                                        :browser_title => BROWSER_TITLE } )
cafeteria_page.translations.create!( { :locale => "ca", 
                                       :title => "Cafeteria",
                                       :meta_description => META_DESCRIPTION, 
                                        :browser_title => BROWSER_TITLE } )

cafe_path = "#{Rails.root.join('app/assets/images/cafe/coffee800x800.jpg')}"
cafe2_path = "#{Rails.root.join('app/assets/images/cafe/IMG_2667.jpg')}"
cafe3_path = "#{Rails.root.join('app/assets/images/cafe/IMG_2885.jpg')}"
entrepans_path = "#{Rails.root.join('app/assets/images/entrepans/IMG_2872.jpg')}"
entrepans_path2 = "#{Rails.root.join('app/assets/images/entrepans/5405.jpg')}"
entrepans_path3 = "#{Rails.root.join('app/assets/images/entrepans/cocapernil.jpg')}"
sucs_i_tees_path = "#{Rails.root.join('app/assets/images/sucs_i_tees/IMG_2603.jpg')}"
sucs_i_tees_path2 = "#{Rails.root.join('app/assets/images/sucs_i_tees/te.jpg')}"
suc_verd_path = "#{Rails.root.join('app/assets/images/sucs_i_tees/sucsverds.jpg')}"
cervesa_path = "#{Rails.root.join('app/assets/images/cerveza/5418.jpg')}"
cervesa_path2 = "#{Rails.root.join('app/assets/images/cerveza/cervesa.jpg')}"
cervesa_path3 = "#{Rails.root.join('app/assets/images/cerveza/4851.jpg')}"

reposteria_path = "#{Rails.root.join('app/assets/images/reposteria/reposteria.jpg')}"
reposteria2_path = "#{Rails.root.join('app/assets/images/reposteria/IMG_1856.jpg')}"
reposteria3_path = "#{Rails.root.join('app/assets/images/reposteria/reposteria3.jpg')}"

logo_path = "#{Rails.root.join('app/assets/images/logos/logo_negro.jpg')}"

image_cafe = Refinery::Image.create :image => File.new(cafe_path)
image_cafe2 = Refinery::Image.create :image => File.new(cafe2_path)
image_cafe3 = Refinery::Image.create :image => File.new(cafe3_path)
image_entrepans = Refinery::Image.create :image => File.new(entrepans_path)
image_entrepans2 = Refinery::Image.create :image => File.new(entrepans_path2)
image_entrepans3 = Refinery::Image.create :image => File.new(entrepans_path3)
image_sucs_i_tees = Refinery::Image.create :image => File.new(sucs_i_tees_path)
image_sucs_i_tees2 = Refinery::Image.create :image => File.new(sucs_i_tees_path2)
image_suc_verd = Refinery::Image.create :image => File.new(suc_verd_path)
image_cervesa = Refinery::Image.create :image => File.new(cervesa_path)
image_cervesa2 = Refinery::Image.create :image => File.new(cervesa_path2)
image_cervesa3 = Refinery::Image.create :image => File.new(cervesa_path3)

image_reposteria = Refinery::Image.create :image => File.new(reposteria_path)
image_reposteria2 = Refinery::Image.create :image => File.new(reposteria2_path)
image_reposteria3 = Refinery::Image.create :image => File.new(reposteria3_path)

image_logo = Refinery::Image.create :image => File.new(logo_path)

categories_cafeteria = [ 
  {
    title_ca: "Cafès", 
    title_en: "Coffee",
    title_es: "Cafés",  
    description_ca: "<p>Una de les millors experiències per als sentits és olorar un bon cafè, però encara és millor que sigui bo de gust. Per aquest motiu utilitzem cafè de gamma alta. Seguim el mètode espresso per tal d'aconseguir extreure tota l'aroma d'un cafè acabat de moldre. I seguirem aventurant-nos perquè fer el vostre cafè no sigui tan sols un joc de canell. La mólta i el gramatge exacte, el temps oportú ens donaran un cafè gustós i aromàtic. I amb la llet jugarem al cafe latte.</p>", 
    description_en: "<p>Una de les millors experiències per als sentits és olorar un bon cafè, però encara és millor que sigui bo de gust. Per aquest motiu utilitzem cafè de gamma alta. Seguim el mètode espresso per tal d'aconseguir extreure tota l'aroma d'un cafè acabat de moldre. I seguirem aventurant-nos perquè fer el vostre cafè no sigui tan sols un joc de canell. La mólta i el gramatge exacte, el temps oportú ens donaran un cafè gustós i aromàtic. I amb la llet jugarem al cafe latte.</p>",
    description_es: "<p>Una de las mejores experiencias para los sentidos es oler un buen café, pero aún es mejor que sea bueno de gusto. Por este motivo utilizamos café de alta gama. Seguimos el método espresso para conseguir extraer todo el aroma de un café recién molido. Y seguiremos aventurando para que hacer vuestro café no sea sólo un juego de muñeca. La molienda y el gramaje exacto, el tiempo oportuno nos daran un café sabroso y aromático. Y con la leche jugaremos al café latte.</p>",
    image: image_cafe,
    image2: image_cafe2,
    image3: image_cafe3    
  },
  {
    title_ca: "Te", 
    title_en: "Tee",
    title_es: "Té",  
    description_ca: "<p>Els tes s'elaboren al laboratori d'Artesano Natural de Ripoll, que aposten per l'excel·lència de les matèries primeres i amb la seva imaginació i coneixements ens ofereixen propostes genuïnes i exclusives. Més que un laboratori es podria parlar d'un obrador on els gustos, les aromes i els colors són els protagonistes. Pots mirar la carta de tes.
                      <br><a href='http://www.art-e-sano.com' target='_blank'>www.art-e-sano.com</a>
                      </p>", 
    description_en: "<p>Los tés se elaboran en el laboratorio de Artesano Natural de Ripoll, que apuestan por la excelencia de las materias primas y con su imaginación y conocimientos nos ofrecen propuestas genuinas y exclusivas. Más que un laboratorio se podría hablar de un obrador donde los gustos, los aromas y los colores son los protagonistas. Puedes mirar la carta de tés.
                      <br><a href='http://www.art-e-sano.com' target='_blank'>www.art-e-sano.com</a>
                      </p>", 
    description_es: "<p>Los tés se elaboran en el laboratorio de Artesano Natural de Ripoll, que apuestan por la excelencia de las materias primas y con su imaginación y conocimientos nos ofrecen propuestas genuinas y exclusivas. Más que un laboratorio se podría hablar de un obrador donde los gustos, los aromas y los colores son los protagonistas. Puedes mirar la carta de tés.
                      <br><a href='http://www.art-e-sano.com' target='_blank'>www.art-e-sano.com</a>
                      </p>", 
    image: image_sucs_i_tees,
    image2: image_sucs_i_tees2  
  },
  {
    title_ca: "Suc Verd", 
    title_en: "Green juice",
    title_es: "Zumo verde",  
    description_ca: "<p>Amb l'extractor de sucs en fred o cold pressed que treballa a 43 revolucions per minut (RPM) s'aconsegueix extreure el millor suc, sense escalfar, oxidar, ni perdre vitamines. No és tendència, és la salut com a prioritat.
                      Us agradaria tenir a casa vostra l'extractor Juissen 2? Parleu amb nosaltres!
                      Suc verd de: poma verda, espinacs, llimona, gingebre, api-rave, bròquil.
                      Suc vermell de: remolatxa, pastanaga, poma, llimona.</p>", 
    description_en: "<p>Con el extractor de jugos en frío o cold pressed que trabaja a 43 revoluciones por minuto (RPM) se consigue extraer el mejor jugo, sin calentar, oxidar, ni perder vitaminas. No es tendencia, es la salud como prioridad. ¿Le gustaría tener en casa el extractor Juissen 2? Habla con nosotros! Jugo verde de: manzana verde, espinacas, limón, jengibre, apio nabo, brócoli. Jugo rojo de: remolacha, zanahoria, manzana, limón.</p>",
    description_es: "<p>Con el extractor de jugos en frío o cold pressed que trabaja a 43 revoluciones por minuto (RPM) se consigue extraer el mejor jugo, sin calentar, oxidar, ni perder vitaminas. No es tendencia, es la salud como prioridad. ¿Le gustaría tener en casa el extractor Juissen 2? Habla con nosotros! Jugo verde de: manzana verde, espinacas, limón, jengibre, apio nabo, brócoli. Jugo rojo de: remolacha, zanahoria, manzana, limón.</p>",
    image: image_suc_verd
  },
  {
    title_ca: "Entrepans", 
    title_en: "Sandwitches",
    title_es: "Bocadillos",  
    description_ca: "<p>
                      Pots triar quin és el teu entrepà, et donem diferents alternatives amb tots els nostres pans, mides i ingredients. El protagonista és el pa de coca, fred o calentó, en mida puça, mini o entrepà. Una opció molt garrotxina és la coca dolça de forner farcida de pernil, llonganissa, etc. Si t'estimes més menjar altres tipus de farines, pots provar el pa d'espelta, l'integral amb cereals o el pa de fajol. Però si el que et ve realment de gust és un biquini, no ho dubtis, el fem amb el nostre bembó, un pa de motllo blanc i molt tendre que no et deixarà indiferent. L'embotit és artesà, de Can Bailèn, del proper veïnat de Pocafarina a Sant Privat d'en Bas.
                      Farcit: pernil salat, pernil dolç, formatge d'ovella curat, llonganissa, xoriç vermell, bull blanc, bull negre, tonyina, mantega i melmelada, vegetals i de temporada.
                      </p>", 
    description_en: "<p>
                      Pots triar quin és el teu entrepà, et donem diferents alternatives amb tots els nostres pans, mides i ingredients. El protagonista és el pa de coca, fred o calentó, en mida puça, mini o entrepà. Una opció molt garrotxina és la coca dolça de forner farcida de pernil, llonganissa, etc. Si t'estimes més menjar altres tipus de farines, pots provar el pa d'espelta, l'integral amb cereals o el pa de fajol. Però si el que et ve realment de gust és un biquini, no ho dubtis, el fem amb el nostre bembó, un pa de motllo blanc i molt tendre que no et deixarà indiferent. L'embotit és artesà, de Can Bailèn, del proper veïnat de Pocafarina a Sant Privat d'en Bas.
                      Farcit: pernil salat, pernil dolç, formatge d'ovella curat, llonganissa, xoriç vermell, bull blanc, bull negre, tonyina, mantega i melmelada, vegetals i de temporada.
                      </p>", 
    description_es: "<p>
                      Puedes elegir cuál es tu bocadillo, te damos diferentes alternativas con todos nuestros panes, tamaños e ingredientes. El protagonista es el pan de coca, frío o calentito, en tamaño pulga, mini o bocadillo. Una opción muy garrotxina es la torta dulce de panadero rellena de jamón, salchichón, etc. Si prefieres comer otros tipos de harinas, puedes probar el pan de espelta, el integral con cereales o el pan de trigo sarraceno. Pero si lo que prefieres es un bikini, no lo dudes, lo hacemos con nuestro Bembó, un pan de molde blanco y muy tierno que no te dejará indiferente. El embutido es artesano, de Can Bailén, del vecindario de Pocafarina en Sant Privat d'en Bas.
                      </p>", 
    image: image_entrepans,
    image2: image_entrepans2,
    image3: image_entrepans3  
  },
  {
    title_ca: "Cerveses", 
    title_en: "Beers",
    title_es: "Cervezas",  
    description_ca: "<p>La fermentació és la nostra passió. No hi ha res com un aliment viu que per força s'ha de tractar amb cura. Per això recolzem els artesans del món de la cervesa. Aquí a La Fogaina trobaràs cerveses de <a href='https://calaveracoop.wordpress.com/' target='_blank'>La Calabera Cooperativa</a> de Sant Joan de les Abadeses, de <a href='http://www.lesclandestines.net/' target='_blank'>Les Clandestines</a> de Montferrí a Tarragona i de <a href='https://www.facebook.com/santapauales.cervesavolcanica/' target='_blank'>Santa Pau</a>, d'aquí, de La Garrotxa.
Deixa't sorprendre amb la proposta del tirador!</p>", 
    description_en: "<p>La fermentació és la nostra passió. No hi ha res com un aliment viu que per força s'ha de tractar amb cura. Per això recolzem els artesans del món de la cervesa. Aquí a La Fogaina trobaràs cerveses de La Calavera de Sant Joan de les Abadeses, de <a href='http://www.lesclandestines.net/' target='_blank'>Les Clandestines</a> de Montferrí a Tarragona i de Santa Pau, d'aquí, de La Garrotxa.
Deixa't sorprendre amb la proposta del tirador!</p>",
    description_es: "<p>La fermentación es nuestra pasión. No hay nada como un alimento vivo que por Fuerza se debe tratar con cuidado. Por ESO apoyamos a los artesanos del mundo de la cerveza. Aquí en La Fogaina encontrarás Cervezas de <a href='https://calaveracoop.wordpress.com/' target='_blank'>La Calabera Cooperativa</a> de Sant Joan de les Abadeses, de <a href='http://www.lesclandestines.net/' target='_blank'>Les Clandestines</a> de Montferrí en Tarragona y de <a href='https://www.facebook.com/santapauales.cervesavolcanica/' target='_blank'>Santa Pau</a>, de aquí, de La Garrotxa.
Déjate sorprender con la propuesta del tirador!</p>",
    image: image_cervesa,
    image2: image_cervesa2,
    image3: image_cervesa3  
  },
  {
    title_ca: "Dolços", 
    title_en: "Sweets",
    title_es: "Dulces",  
    description_ca: "<p>
                      L'opció que triem quan elaborem els dolços és qualitat. No dubtem quan escollim els millors ingredients. Les pastes fullades i els croissants separen les seves fulles en el marc d'una bona mantega. El  (pastís de pastanaga) és un viatge de dolços i d'aromes que ens porta als límits entre Orient i Occident. Això sí, som artesans!
                      <ul>
                        <li>Coca de sucre</li>
                        <li>Croissant mantega</li>
                        <li>Napolitana xocolata (pain au chocolat)</li>
                        <li>Croissant pernil i formatge</li>
                        <li>Espiral (sneken)</li>
                        <li>Ulleres</li>
                        <li>Pasta fullada de poma</li>
                        <li>Magdalena d'espelta</li>
                        <ul>
                          <li>Amb panses i anous o amb xocolata</li>
                          <li>Sense gluten (pot contenir traces)</li>
                        </ul>
                        <li>Carrot cake (pastís de pastanaga)</li>
                        <li>Coca de llardons</li>
                        <li>Pasta fullada farcida de xocolata</li>
                        <li>Pasta fullada farcida de cabell d'angel</li>
                        <li>Rajola de xocolata del Cacau</li>
                        <li>Xocolatina</li>
                       </ul>
                      </p>", 
    description_en: "<p>
                      La opción que elegimos cuando elaboramos los dulces es calidad. No dudamos cuando elegimos los mejores ingredientes. Los hojaldres y los croissants separan sus hojas en el marco de una buena mantequilla. El (pastel de zanahoria) es un viaje de dulces y de aromas que nos lleva a los límites entre Oriente y Occidente. Eso sí, somos artesanos!
                      <ul>
                        <li>Coca de sucre</li>
                        <li>Croissant mantega</li>
                        <li>Napolitana xocolata (pain au chocolat)</li>
                        <li>Croissant pernil i formatge</li>
                        <li>Espiral (sneken)</li>
                        <li>Ulleres</li>
                        <li>Pasta fullada de poma</li>
                        <li>Magdalena d'espelta</li>
                        <ul>
                          <li>Amb panses i anous o amb xocolata</li>
                          <li>Sense gluten (pot contenir traces)</li>
                        </ul>
                        <li>Carrot cake (pastís de pastanaga)</li>
                        <li>Coca de llardons</li>
                        <li>Pasta fullada farcida de xocolata</li>
                        <li>Pasta fullada farcida de cabell d'angel</li>
                        <li>Rajola de xocolata del Cacau</li>
                        <li>Xocolatina</li>
                       </ul>
                      </p>", 
    description_es: "<p>
                      La opción que elegimos cuando elaboramos los dulces es calidad. No dudamos cuando elegimos los mejores ingredientes. Los hojaldres y los croissants separan sus hojas en el marco de una buena mantequilla. El (pastel de zanahoria) es un viaje de dulces y de aromas que nos lleva a los límites entre Oriente y Occidente. Eso sí, somos artesanos!
                      <ul>
                        <li>Coca de sucre</li>
                        <li>Croissant mantega</li>
                        <li>Napolitana xocolata (pain au chocolat)</li>
                        <li>Croissant pernil i formatge</li>
                        <li>Espiral (sneken)</li>
                        <li>Ulleres</li>
                        <li>Pasta fullada de poma</li>
                        <li>Magdalena d'espelta</li>
                        <ul>
                          <li>Amb panses i anous o amb xocolata</li>
                          <li>Sense gluten (pot contenir traces)</li>
                        </ul>
                        <li>Carrot cake (pastís de pastanaga)</li>
                        <li>Coca de llardons</li>
                        <li>Pasta fullada farcida de xocolata</li>
                        <li>Pasta fullada farcida de cabell d'angel</li>
                        <li>Rajola de xocolata del Cacau</li>
                        <li>Xocolatina</li>
                       </ul>
                      </p>", 
    image: image_reposteria,
    image2: image_reposteria2,
    image3: image_reposteria3  
  }
]

categories_cafeteria.each do |category_attr|

  category = Refinery::CafeteriaCategories::CafeteriaCategory.create!( 
    locale: "en", 
    title: category_attr[:title_en], 
    description: category_attr[:description_en], 
    image: category_attr[:image],
    image2: category_attr[:image2],
    image3: category_attr[:image3] )

  category.translations.create!( { :refinery_cafeteria_category_id => category.id, 
                                   :locale => "ca",
                                   :title => category_attr[:title_ca], 
                                   :description => category_attr[:description_ca] } )

  category.translations.create!( { :refinery_cafeteria_category_id => category.id,
                                   :locale => "es",
                                   :title => category_attr[:title_es], 
                                   :description => category_attr[:description_es]  } )
end

# Added by Refinery CMS Videos extension
Refinery::Videos::Engine.load_seed

videos_page = Refinery::Page.find_by(:title => "Videos")

raise "Error, there should be a videos page! See seeds.rb" if videos_page == nil

videos_page.translations.create!( { :locale => "es", 
                                    :title => "Videos",
                                    :meta_description => META_DESCRIPTION, 
                                    :browser_title => BROWSER_TITLE } )
videos_page.translations.create!( { :locale => "ca", 
                                    :title => "Videos",
                                    :meta_description => META_DESCRIPTION, 
                                    :browser_title => BROWSER_TITLE} )

videos_page.update!( :show_in_menu => false )


Refinery::Videos::Video.create!( :title => "Fogaina",
                          :address => "https://www.youtube.com/embed/qC_hegFxyb4" )
