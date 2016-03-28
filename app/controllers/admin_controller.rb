class AdminController < ApplicationController
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

	private
	def admin_params
		params.require(:admin).permit(:name, :email, :password)
	end
end
