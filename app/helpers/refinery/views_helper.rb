module Refinery
  module ViewsHelper
    # In order to display properly all breads/news in my view, 
    # I need to add empty columns if the number 
    # of breads/news is not a divisor of 3, therefore all of those functions
    # defined here and used in views/refinery/breads/breads/index.html.erb 
    # and in views/refinery/news/items/index.html.erb          

    def foundation_styles
      [
        "fade-in", 
        #"slide-in-left", 
        #"fade-in-new-background"
      ]
    end

    def number_of_slices_of_three(elements)
      elements.count / 3.0
    end

    def last_slice_of_three(elements)
      number_of_slices_of_three(elements).ceil
    end

    def last_index_slice_of_three(elements)
      last_slice_of_three(elements) -1
    end

    def extra_empty_rows(elements)
      empty_rows = 0
      last_slice = last_slice_of_three(elements)
      slices = number_of_slices_of_three(elements)

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
