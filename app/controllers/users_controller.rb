class UsersController < ApplicationController
  before_action :authenticate_user!

  def account
    @user = current_user
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    binding.pry
    if @user.update(profile_params)
      @user.image.purge if params[:delete_image].present?
      flash[:notice] = "プロフィールを更新しました"
      redirect_to root_path
    else
      render:edit
    end
  end

  private
  def profile_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end
