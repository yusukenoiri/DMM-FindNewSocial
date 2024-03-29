# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super UserMailer.with(user: @user).welcome_email.deliver_later
  # end

  # POST /resource/sign_in
  # def create
  #   super UserMailer.with(user: @user).welcome_email.deliver_later
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def reject_inactive_user
    @user = User.find(params[:user][:id])
    if @user
      if @user.valid_password?(params[:user][:id]) && !@user.is_valid
        redirect_to new_user_session_path
      end
    end
  end
end
