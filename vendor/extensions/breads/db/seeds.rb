page_title = { :en => 'Our breads',
               :es => 'Nuestros panes',
               :ca => 'Els nostres pans'}

if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms_news').blank?
      user.plugins.create(:name => 'refinerycms_news')
    end
  end
end

if defined?(::Refinery::Page)
  unless ::Refinery::Page.where(:menu_match => "^/breads.*$").any?
    page = ::Refinery::Page.create(
      :title => page_title[:en],
      :link_url => "/breads",
      :deletable => false,
      :menu_match => "^/breads.*$"
    )

    ::Refinery::Pages.default_parts.each do |default_page_part|
      page.parts.create(title: default_page_part[:title], slug: default_page_part[:slug], body: nil)
    end
  end
end
