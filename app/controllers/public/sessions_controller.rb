# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
   before_action :configure_permitted_parameters, if: :devise_controller?
    
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  
    def after_sign_in_path_for(resource)
        public_users_mypage_path
    end
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
    
    def reject_end_user
        @end_user = User.find_by(email: params[:user][:email])
        if @end_user
            if @end_user.valid_password?(params[:user][:password]) && (@end_user.is_deleted == true)
                flash[:notice] = "退会済みです。再度ご登録をしてご利用ください。"
                redirect_to new_user_registration_path
            else
                flash[:notice] = "項目を入力してください"
            end
        else
            flash[:notice] = "該当するユーザーが見つかりません"
        end
    end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
