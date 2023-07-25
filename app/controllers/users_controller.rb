class UsersController < ApplicationController
	before_action :authenticate_user!
	
	def top
		@user = current_user
	end
	
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
		if @user.update(profile_params)
			flash[:notice] = "プロフィールを更新しました"
			redirect_to users_top_path
		else
			render:edit
		end
	end

	private
	def profile_params
		params.require(:user).permit(:name, :introduction, :image)
	end
end
