module Refinery
  module CafeteriaCategories
    class CafeteriaCategoriesController < ::ApplicationController

      before_action :find_all_cafeteria_categories
      before_action :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @cafeteria_category in the line below:
        present(@page)
      end

      def show
        @cafeteria_category = CafeteriaCategory.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @cafeteria_category in the line below:
        present(@page)
      end

    protected

      def find_all_cafeteria_categories
        @cafeteria_categories = CafeteriaCategory.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/cafeteria_categories").first
      end

    end
  end
end
