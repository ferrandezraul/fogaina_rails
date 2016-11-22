

# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "http://www.lafogaina.com"

# pick a safe place safe to write the files
SitemapGenerator::Sitemap.public_path = 'tmp/sitemaps/'

SitemapGenerator::Sitemap.create do
  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #
  #   Article.find_each do |article|
  #     add article_path(article), :lastmod => article.updated_at
  #   end

  # This only adds the english page paths
  #Refinery::Page.find_each do |page|
  #  add Refinery::Core::Engine.routes.url_helpers.page_path(page), :lastmod => page.updated_at
  #end

  [:ca, :es].each do |locale|
    Refinery::Page.find_each do |page|
      add Refinery::Core::Engine.routes.url_helpers.page_path(page, :locale => locale), :lastmod => page.updated_at
    end
  end
end
