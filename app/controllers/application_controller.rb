class ApplicationController < ActionController::Base
  before_action :basic_auth
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == '2222'
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:nick_name, :family_name_kanji, :personal_name_kanji, :family_name_kana, :personal_name_kana, :birthdate])
    end

  end
end
