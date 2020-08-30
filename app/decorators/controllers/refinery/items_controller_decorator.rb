Refinery::News::ItemsController.class_eval do
	before_filter :find_page
      before_filter :find_published_news_items, :only => [:index]
      before_filter :find_news_item, :find_latest_news_items, :only => [:show]

      def index
        # render 'index'
      end

      def show
        # render 'show'
      end

      def archive
        if params[:month].present?
          @archive_for_month = true
          @archive_date = Time.parse("#{params[:month]}/#{params[:year]}")
          @items = Refinery::News::Item.archived.translated.by_archive(@archive_date).page(params[:page])
        else
          @archive_date = Time.parse("01/#{params[:year]}")
          @items = Refinery::News::Item.archived.translated.by_year(@archive_date).page(params[:page])
        end
      end

      protected

      def find_latest_news_items
        @items = Refinery::News::Item.latest.translated
      end

      def find_published_news_items
        @items = Refinery::News::Item.published.translated.page(params[:page])
      end

      def find_news_item
      	title = params[:id]

      	all_news = Refinery::News::Item.all.each do |news_item| 
      		#puts "\n\nNews Item with title #{news_item.title} and slug #{news_item.slug} and searching #{title}\n\n"
      		if news_item.slug.downcase == title.downcase
	      		#puts "Title #{title} found!!"
	      		#puts "Lets look for news item with id #{news_item.id}"
	      		@item = Refinery::News::Item.translated.friendly.find(news_item.id)
	      		#puts "I found a news item with id #{@item.id} and title #{@item.title}"

	      	end
      	end
      end

      def find_page
        @page = Refinery::Page.find_by_link_url("/news") if defined?(Refinery::Page)
      end
end