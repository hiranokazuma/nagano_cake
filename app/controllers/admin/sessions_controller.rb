# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

    def after_sign_in_path_for(resource)
      admin_homes_top_path(resource)
    end

    def after_sign_out_path_for(resource)
      new_admin_session_path
    end

  # # GET /resource/sign_in
  # def new
  #   # super
  # end

  # # # POST /resource/sign_in
  # def create
  #   admin = Admin.find_by!(mail: params[:mail]) # 入力されたメールアドレスからユーザーを検索

  #   if admin.authenticate(params[:password]) # パスワードを検証
  #   session[:user_mail] = admin.mail # 検証OKなら、セッションにメールアドレスを保存
  #   redirect_to admin_homes_top_path # 一覧画面へ遷移
  #   else
  #   render ‘new’ # パスワード検証NGなら、ログイン画面を再表示
  #   end
  # end

  # # # DELETE /resource/sign_out
  # def destroy
  #   session[:admin_mail] = nil # セッション情報を削除
  #   redirect_to new_admin_session_path # ログイン画面へ遷移
  # end

  # protected

  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
