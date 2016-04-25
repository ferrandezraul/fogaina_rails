# Refinery::I18n.frontend_locales.each do |lang|
#   I18n.locale = lang

#   Refinery::User.find_each do |user|
#     user.plugins.where(name: 'refinerycms-cafeteria_categories').first_or_create!(
#       position: (user.plugins.maximum(:position) || -1) +1
#     )
#   end if defined?(Refinery::User)

#   Refinery::Page.where(link_url: (url = "/cafeteria_categories")).first_or_create!(
#     title: 'Cafeteria Categories',
#     deletable: false,
#     menu_match: "^#{url}(\/|\/.+?|)$"
#   ) do |page|
#     Refinery::Pages.default_parts.each_with_index do |part, index|
#       page.parts.build title: part[:title], slug: part[:slug], body: nil, position: index
#     end
#   end if defined?(Refinery::Page)
# end

#########################


if defined?(::Refinery::User)
  ::Refinery::User.all.each do |user|
    if user.plugins.where(:name => 'refinerycms-cafeteria_categories').blank?
      user.plugins.create(:name => 'refinerycms-cafeteria_categories')
    end
  end
end

if defined?(::Refinery::Page)
  page = Refinery::Page.where(link_url: (url = "/cafeteria_categories")).first_or_create!(
      :title => "Cafeteria",
      deletable: false,
      menu_match: "^#{url}(\/|\/.+?|)$" )

  Refinery::Pages.default_parts.each do |default_page_part|
    page.parts.create(title: default_page_part[:title], slug: default_page_part[:slug], body: nil)
  end
end