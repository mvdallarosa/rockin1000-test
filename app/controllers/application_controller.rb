class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    if defined?(cookies[:language])
      if defined?(params) && params[:locale]
        I18n.locale = I18n.available_locales.include?(params[:locale].to_sym) ? params[:locale] : I18n.default_locale
        set_cookie(I18n.locale)
      else
        I18n.locale = cookies[:language]
      end
    elsif defined?(request.env['HTTP_ACCEPT_LANGUAGE'])
      detected_language = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      I18n.locale = I18n.available_locales.include?(detected_language.to_sym) ? detected_language : I18n.default_locale
      set_cookie(I18n.locale)
    end
    locale = I18n.locale || I18n.default_locale
    return locale
    set_cookie(locale)
  end

  def set_cookie(locale)
    cookies[:language] = locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
