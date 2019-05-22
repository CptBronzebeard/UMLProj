class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy,:edit_form]
  before_action :is_admin, except: [:show]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])
    render "props"
  end

  # GET /products/new
  def new
    #if params[:category]
      @product = Product.new
      @product.category = Category.find(params[:category])
      @product.save

      respond_to do |format|
        format.js{}
      end
    #else
    #  redirect_to ''

  end
  def new_form
    @product=Product.new
    @product.category=Category.first
    @product.save
  end


  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    #byebug
    @product = Product.new(product_params)
    #byebug
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    #byebug
    respond_to do |format|
      if @product.update(product_params)
        @product.category = Category.find(params.fetch("product")["category"])
        #byebug
        tmp = PropertyValue.where(product_id:@product.id).where.not(property:@product.properties)
        tmp.each do |i|
          i.destroy
        end
        @product.properties.each do |e|

          tmp=PropertyValue.find_by(product_id:@product.id,property_id:e.id)
          if tmp.nil?
            if e.type=="IntegerProperty"
              tmp = IntegerValue.new
            else
              tmp = StringValue.new
            end
          end
          tmp.property = e
          tmp.product = @product
          #byebug
          tmp.value = params.fetch("product").fetch("properties")[e.id.to_s]["id"]
          tmp.save
            #code
        end
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
    @product.save
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    #PropertyValue.where(product_id:@product.id).delete_all
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def edit_form
    #byebug
    tmp = Category.find(params[:category])

    if tmp != @product.category
      @product.category=tmp
      #@product.property_values.clear
      #byebug
      @product.properties.each do |e|
        tmp=PropertyValue.find_by(property_id:e.id,product_id:@product.id)
        if tmp.nil?
          tmp=e.getProp("")
          tmp.product=@product
        end
        #byebug
        @product.property_values.push(tmp)
        #byebug
      end
    #else
    #  byebug
    #  @product.property_values=PropertyValue.where(product_id:@product.id)
    end

      respond_to do |format|
        format.js{}
      end
    end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      #params.fetch(:product)
      params.require(:product).permit(:name,:price,property_values:[:value])
    end
end
