class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  #before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index

  end

  def new
    @product = Product.find(params[:product_id])
    @order = @product.orders.new  
  end

  def create
    @product = Product.find(params[:product_id])
    @order = @product.orders.new(order_params)
    @order.user = current_user
    if @order.save
      redirect_to products_path
    else
      flash[:errors] = @order.errors.full_messages
      render 'orders/new'
    end

  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
    @order.destroy
    redirect_to products_path
  end
  private
    def order_params
      params.require(:order).permit(:quantity)
    end

    def set_order
      @order= Order.find(params[:id])
    end

    def set_product
      @product = Product.find(params[:product_id])
    end
    
end
