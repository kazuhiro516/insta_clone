class RegistrationsController < Devise::RegistrationsController

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find(resource_name)
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      flash[:alert] = "更新に失敗しました"
      render 'edit'
    end
  end

  protected
    def user_params
      params.permit(:name, :email, :password, :authenticity_token,:commit,:_method,
                                   :password_confirmation, :introduction)
    end

    def update_resource(resource, params)
      resource.update_without_current_password(params)
    end

    # アカウントをアップデートしたときにどのパスに移動するか定義する
    def after_update_path_for(resource)
      user_path(resource)
    end
end