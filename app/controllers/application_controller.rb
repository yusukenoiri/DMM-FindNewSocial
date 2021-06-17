class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters , if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admin_posts_path  #Adminのログイン後
    when User
      root_path         #Userのログイン後
    end
  end

  def after_sign_out_path_for(resource)

    case resource
    when :admin
      admin_session_path # ログアウト後に遷移するpathを設定
    when :user
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
      :nick_name,
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :email,
      :occupation,
      :address,
      :sex,
      :generation
      ])
  end

end