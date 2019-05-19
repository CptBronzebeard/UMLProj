class OrdersController < ApplicationController
  before_action :set_order, only: [:edit, :update, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def pay
    if (params[:order] == cookies[:cart]) && params[:order]!="" && !cookies[:cart].nil?
      tmp = Order.find(cookies[:cart])
      #payment logic insertion point
      tmp.entries.each do |e|
        e.total = e.amount * e.product.price
        e.save
      end
      tmp.completed=true
      tmp.save
      render :file => 'public/payment.html'
    end
  end

  def show
    if !(cookies[:cart].nil? || cookies[:cart]=="")
      @order=Order.find(cookies[:cart])
    else
      render :file => 'public/empty.html'
    end
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  def add
    @product=Product.find(params[:product])
  end
  def cart
    #byebug
    product = Product.find(params[:product])
    amount = params[:Amount]

    if cookies[:cart].nil? || cookies[:cart]==""
      @order = Order.new
      @order.user = current_user
      @order.save
      cookies[:cart] = @order.id
    else
      #byebug
      @order = Order.find(cookies[:cart])
    end
    tmp = Entry.new
    tmp.product=product
    tmp.order_id = @order.id
    tmp.amount = amount
    tmp.save
    redirect_to action:"show"
  end
  # GET /orders/1/edit
  def edit
  end
  def deleted
    @order = Order.find(cookies[:cart])
    if @order.entries.empty?
      @order.destroy
      cookies[:cart]=nil
    end
    redirect_to action:"show"

  end
  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.fetch(:order, {})
    end
end
