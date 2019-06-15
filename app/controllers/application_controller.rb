class ApplicationController < ActionController::Base
  #このコードがあると、Railsで生成されるすべてのフォームとAjaxリクエストにセキュリティトークンが自動的に含まれます。セキュリティトークンがマッチしない場合には例外がスローされます。(Railsガイド)
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  
  before_action :authenticate_user!, only: [:show,:edit,:update, :destroy, :following, :followers, :matchers]
  
  # ログイン後、users/indexに移動する
  def after_sign_in_path_for(resource)
    users_path(resource)
  end
  
  

  protected
  
  #configure_permitted_parametersはストロングパラメータを設定するメソッド。
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
  #def configure_permitted_parameters
    #additional_params = [:name, :company, :email_confirmation,   {addresses_attributes: [:address1, :address2, :city, :state, :zip, :country, :name]}]
    #devise_parameter_sanitizer.permit(:sign_up, keys: additional_params)
    #devise_parameter_sanitizer.permit(:account_update, keys: additional_params)
  #end
end
