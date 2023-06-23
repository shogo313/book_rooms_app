class UsersController < ApplicationController
	
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
		@user.update(params.require(:user).permit(:name, :introduction))
	end

end
