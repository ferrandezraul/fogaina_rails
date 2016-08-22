module Refinery
  module CafeteriaCategories
    module Admin
      class CafeteriaCategoriesController < ::Refinery::AdminController

        crudify :'refinery/cafeteria_categories/cafeteria_category'

        private

        # Only allow a trusted parameter "white list" through.
        def cafeteria_category_params
          params.require(:cafeteria_category).permit(:title, :description, :image_id, :image2_id, :image3_id)
        end
      end
    end
  end
end
