module Refinery
  module Breads
    class BreadsController < ::ApplicationController

      before_action :find_all_breads
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bread in the line below:
        present(@page)
      end

      def show
        @bread = Bread.friendly.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @bread in the line below:
        present(@page)
      end

    protected

      def find_all_breads
        @breads = Bread.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/breads").first
      end

    end
  end
end
