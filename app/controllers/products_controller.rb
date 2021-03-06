class ProductsController < ApplicationController
 
# before_filter :ensure_logged_in, :only => [:show]



  def index
   	@products = Product.all

   	respond_to do |format|
   		format.html
   		format.json {render json: @products}
   	end	
  end

  def show
  	@product = Product.find(params[:id])

    if current_user
      @review = @product.reviews.build
    end

  	respond_to do |format|
   		format.html
   		format.json {render json: @product}
 	  end	
  end

  def new
  	@product = Product.new
 
  	respond_to do |format|
 		format.html
 		format.json {render json: @product}
 	  end	
  end

  def edit
  	@product = Product.find(params[:id])
# 
  end

  def create
	  @product = Product.new(params[:product])

	  respond_to do |format|
		  if @product.save

		  	format.html { redirect_to @product, notice: "Product was successfully created." }
		  	format.json { render json: @product, status: :created, location: @product }
		  else
        flash.now[:alert] = "Oh no!"
		  	format.html { render action: "new" }
		  	format.json { render json: @product.errors, status: :unprocessable_entity }

		  end
	  end	  	
  end

	def update
		@product = Product.find(params[:id])
    # debugger
    @product.update_tags(params[:tag_list])
		if @product.update_attributes(params[:product])
			redirect_to product_path(@product)
		else	
			render :edit
		end	
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to products_url
		
	end




end
