class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  # GET /products or /products.json
  def index
    # @products = Product.all
    # @products = Product.paginate(page: params[:page], per_page: 30)
    @q = Product.ransack(params[:q])
    @products = @q.result.includes(:tags, :malls).paginate(page: params[:page], per_page: 30)

    @tags = Tag.all
  end

  def search
    # index
    # render :index

    if params[:tag_name] && params[:tag_name] != "" && params[:mall_name] && params[:mall_name] != ""
      products_no_filtered = Product.joins(:tags, :malls).where(tags:  { name: [params[:tag_name]] },
                                                                malls: { name: [params[:mall_name]] })
    elsif params[:tag_name] && params[:tag_name] != ""
      products_no_filtered = Product.joins(:tags).where(tags: { name: [params[:tag_name]] })
    elsif params[:mall_name] && params[:mall_name] != ""
      products_no_filtered = Product.joins(:malls).where(malls: { name: [params[:mall_name]] })
    else
      products_no_filtered = Product.all
    end
    puts products_no_filtered
    @products = products_no_filtered
  end

  # GET /products/1 or /products/1.json
  def show; end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit; end

  # POST /products or /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.require(:product).permit(:name, :price, :image_link, :product_link, :website_link,
                                    :description, :rating, :category_id, :type_id)
  end
end
