class HomeController < ApplicationController
  def index
  	@Users = User.all
  end

  def about
  end
end
