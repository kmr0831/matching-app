class ApplicationController < ActionController::Base
  #このコードがあると、Railsで生成されるすべてのフォームとAjaxリクエストにセキュリティトークンが自動的に含まれます。セキュリティトークンがマッチしない場合には例外がスローされます。(Railsガイド)
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  #configure_permitted_parametersはストロングパラメータを設定するメソッド。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
