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
  end

end
