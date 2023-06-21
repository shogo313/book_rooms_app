class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
		binding.pry
	end
		
	def update
		binding.pry
		@user = User.find(params[:id])
		@user.update(params.require(:user).permit(:name))
		binding.pry
	end

end
