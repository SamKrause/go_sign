class CategoriesController < ApplicationController
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
  def category_params
    params.require(:category).permit(:name, :admin_id)
  end
end
