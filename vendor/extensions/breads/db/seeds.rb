Refinery::I18n.frontend_locales.each do |lang|
  I18n.locale = lang

  Refinery::User.find_each do |user|
    user.plugins.where(name: 'refinerycms-breads').first_or_create!(
      position: (user.plugins.maximum(:position) || -1) +1
    )
  end if defined?(Refinery::User)

  if defined?(Refinery::Page)
    page_bread = Refinery::Page.where(link_url: (url = "/breads")).first_or_create!(
    title: 'Our breads',
    deletable: false,
    menu_match: "^#{url}(\/|\/.+?|)$"
    ) do |page|    
      Refinery::Pages.default_parts.each_with_index do |part, index|
        page_part = page.parts.build title: part[:title], slug: part[:slug], body: nil, position: index
      end

    end 

    page_bread.translations.create!( { :locale => 'es', :title => "Nuestros panes" } )
    page_bread.translations.create!( { :locale => 'ca', :title => "El nostres pans" } )

    #page_part.translations.create!( { :locale => "es", :body => "" } )
    #page_part.translations.create!( { :locale => "ca", :body => "" } )
  end

end
