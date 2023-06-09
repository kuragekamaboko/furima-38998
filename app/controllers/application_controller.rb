class ApplicationController < ActionController::Base
  before_action :basic_auth

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:surname, :name_kana, :surname_kana, :email,:encrypted_password, :year, :month, :day,])
  end


  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  # 環境変数を読み込む記述に変更
    end
  end
end
