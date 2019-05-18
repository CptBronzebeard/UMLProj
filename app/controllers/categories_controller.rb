class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy, :get_props,:filter]

  # GET /categories
  # GET /categories.json
  def index
    @categories = Category.all
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @search=params[:search]
    #byebug
    if !@category.is_cat?
      @categories=Array.new
      @categories.push(@category)

      render "cat_list"
    else
      render "build_cat"
    end
  end
  def build_cat
    @search=params[:search]
    @category=Category.find(params[:category])
    #byebug
    @filters = Hash.new
    @properties=@category.properties
    @products=@category.products
    #byebug
    @category.properties.each do |p|
      tmp=p.property_values.map{|pv| pv.value}
      if p.type=="IntegerProperty"
        @filters[p]=tmp.minmax
        #@fiilters[p].each do |e|
      else
        tmp1=tmp.uniq
        #byebug
        @filters[p]=tmp1
      end
    end
    respond_to do |format|
      format.js{}
      format.html{}
    end
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit

  end

  # POST /categories
  # POST /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    byebug
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Category was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json {  }
    end
  end
  def get_props
    @search=params[:search]
    @category.properties
    respond_to do |format|
      format.js {  }
    end
  end
  def filter
    #byebug
    @products=Array.new
    @search=params[:search]
    filters=params[:filters]
    if !filters.nil?
      if @search.nil? || @search==""
        #tmp=
        @matches=@category.products
      else
        @category.products.each do |p|
          if p.name.include?(params[:search])
            @matches.push(p)
          end
        end
      end
      filters.each do |f,v|
          @matches.each do |e|
            tmp1=Property.find(f)

              tmp=e.property_values.find_by(property_id:f)
              if tmp1.type=="StringProperty"
               if v.include?(tmp.value)
                 @products.push(e)
               end
             else
               if tmp.value>=v.first && tmp.value<=v.second
                 @products.push(e)
               end
            end
          end

       end
     else
       @products=@category.products
     end
    respond_to do |format|
      format.js{}
    end
  end
  def search
    @search=params[:search]

  end

  #def is_cat?
  #  subcategories.empty?
#  end
  #helper_method :is_cat?
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.fetch(:category, {})
    end
end
