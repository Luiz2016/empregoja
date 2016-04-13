class CategoriesController < ApplicationController
  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to @category
  end

  def show
    @category = Category.find(params[:id])
  end
end
