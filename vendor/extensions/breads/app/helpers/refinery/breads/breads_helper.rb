module Refinery
  module Breads
    module BreadsHelper

      def translate_available_days(available_days)
        result = ""

        if available_days and !available_days.empty? and !available_days.include?( 'no_mostrar' )
          
          # available_days es un string con forma de Array
          # i.e "[:monday, :tuesday]"
          # por eso aqui lo convierto de nuevo a un Array 
          available_days_array = available_days.gsub(/\[|\]/, '').split(", ")
          
          # e itero los elementos para despues encontrar sus traducciones 
          available_days_array.each_with_index do |day, index|
          # quitamos los ':' y los "" para poder encontrar la traduccion
            clean_day = ::I18n.t( day.gsub(/:/, '').gsub(/"/, '') )
            if index == 0
              result = result + clean_day
            elsif ( index == ( available_days_array.length - 1 ) )
              result = result + ::I18n.t( 'and' ) + clean_day
            else
              result = result + ", " + clean_day
            end

          end
                
        end  

        result
      end

    end
  end
end