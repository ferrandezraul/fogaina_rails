module Refinery
  module Breads
    module Admin
      class BreadsController < ::Refinery::AdminController

        crudify :'refinery/breads/bread',
                :title_attribute => 'name'

        private

        # Only allow a trusted parameter "white list" through.
        def bread_params
          params.require(:bread).permit(:name, 
                                        :description,
                                        :photo_id, 
                                        :photo2_id, 
                                        :photo3_id, 
                                        :price, 
                                        available_days: [])
        end
      end
    end
  end
end
