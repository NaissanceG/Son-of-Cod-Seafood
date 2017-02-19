class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_rights, only: [:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = current_user.products.build
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      flash[:success]= "The Product has been successfully added"
      redirect_to root_path
    else
      flash[:alert]= "Sorry, The Product has been Not added, Consult the error message(s)"
      render :new
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:success] = "The product has been successfully updated"
      redirect_to root_path
    else
      flash[:alert] = "Update failed. Please consult the error messages for further details"
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Your Post has been deleted!"
    redirect_to root_path
  end

private
  def product_params
    params.require(:product).permit(:image, :name, :description, :price, :origin, :species)
  end

  def admin_rights
    unless current_user.admin == true
      flash[:alert] = "You are not an admin"
      redirect_to root_path
    end
  end
end
