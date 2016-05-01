module Refinery
  module HeaderHelper
    
    def current_locale_to_display
      result = ""

      if ::I18n.locale == :en
        result = t('englishUK' )
      elsif ::I18n.locale == :es
        result = t('spanish' )
      elsif ::I18n.locale == :ca
        result = t('catalan' )
      end

      result
    end


    def spanish_available?
      Refinery::Setting.get( :spanish_web ) == true
    end

    def english_available?
      Refinery::Setting.get( :english_web ) == true
    end

    def only_default_locale_available?
      ( Refinery::Setting.get( :spanish_web ) == false ) && ( Refinery::Setting.get( :english_web ) == false ) 
    end

    def multiple_locales_available?
      spanish_available? || english_available?
    end

  end
end
