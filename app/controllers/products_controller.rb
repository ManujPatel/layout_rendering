class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      format.html { redirect_to products_path, notice: "Product was successfully created." }
    else
      flash[:errors] = @product.errors.full_messages
      render 'new_product_path'
    end

  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to product_url(@product), notice: "Product was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path
  end
  private
    def product_params
      params.require(:product).permit(:name, :description, :price)
    end

    def set_product
      @product= Product.find(params[:id])
    end

end
