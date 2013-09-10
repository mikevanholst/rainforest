class CategoriesController < ApplicationController
  def index
     @category = Category.all
  end

  def show
    @category = Category.find(params[:id])

  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      redirect_to products_url, :notice => "Category added!"
    else
      render :new
    end
  end  
end
