class ApplicationController < ActionController::Base
  before_action :set_locale

  def set_locale
    if defined?(params) && params[:locale]
      I18n.locale = I18n.available_locales.include?(params[:locale].to_sym) ? params[:locale] : 'en'
    elsif defined?(request.env['HTTP_ACCEPT_LANGUAGE'])
      detected_language = request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
      I18n.locale = I18n.available_locales.include?(detected_language.to_sym) ? detected_language : 'en'
    # elsif defined?(current_user) && current_user && current_user.language_id.present?
    #   I18n.locale = current_user.language.code
    end
    I18n.locale || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end
end
