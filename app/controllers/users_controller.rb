class UsersController < ApplicationController
 	def index
	end

	def show
	end

	def new
	end
	 
	def create
	end

	def update
	end

	def destroy
	end
	
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
	end
end
