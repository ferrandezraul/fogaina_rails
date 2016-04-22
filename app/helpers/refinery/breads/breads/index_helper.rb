module Refinery
  module Breads
    module Breads
      module IndexHelper
        # In order to display properly all breads in my view, 
        # I need to add empty columns if the number 
        # of breads is not a divisor of 3, therefore all of those functions
        # defined here and used in views/refinery/breads/breads/index.html.erb           

        def foundation_styles
          [
            "fade-in", 
            #"slide-in-left", 
            #"fade-in-new-background"
          ]
        end

        def number_of_slices_of_three(breads)
          breads.count / 3.0
        end

        def last_slice_of_three(breads)
          number_of_slices_of_three(breads).ceil
        end

        def last_index_slice_of_three(breads)
          last_slice_of_three(breads) -1
        end

        def extra_empty_rows(breads)
          empty_rows = 0
          last_slice = last_slice_of_three(breads)
          slices = number_of_slices_of_three(breads)

          if last_slice - slices == 0
            empty_rows = 0
          elsif last_slice - slices > 0.5
            empty_rows = 2
          elsif last_slice - slices < 0.5
            empty_rows = 1
          end

          empty_rows
        end

      end
    end
  end
end
