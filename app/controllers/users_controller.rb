class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end
		
	def update
		@user = User.find(params[:id])
		binding.pry
		@user.update(params.require(:user).permit(:name, :introduction))
		binding.pry
	end

end
