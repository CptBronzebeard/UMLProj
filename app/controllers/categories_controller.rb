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
    #
    if !@category.is_cat?
      @categories=Array.new
      @categories.push(@category)

      render "cat_list"
    else
      redirect_to controller:'categories',action:'build_cat',id:@category.id,search:@search
      #redirect_to "/categories/"+@category.id.to_s+"/catalog", search:@search
    end
  end
  def build_cat
    @search=params[:search]
    @category=Category.find(params[:id])
    #
    @filters = Hash.new
    @properties=@category.properties
    @matches = Array.new
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
    @products=@matches
    #

    @category.properties.each do |p|
      tmp=p.property_values.map{|pv| pv.value}
      if p.type=="IntegerProperty"
        @filters[p]=tmp.minmax
        #@fiilters[p].each do |e|
      else
        tmp1=tmp.uniq
        #
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
    #
    @products=Array.new
    @search=params[:search]
    @matches=Array.new
    filters=params[:filters]
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
    if !filters.nil?
      #
      @matches.each do |e|
        flag=true
      filters.each do |f,va|

            tmp1=Property.find(f)

              tmp=e.property_values.find_by(property_id:f)
              if tmp1.type=="StringProperty"
                #byebug
               if va.include?(tmp.value)
               else
                 flag=false
               end
             else
               a1 = va.first
               a2 = va.second
               tmpv = tmp.value.to_i
               #
               if a1!="" && a2!=""
                 if tmpv>=va.first.to_i && tmpv<=va.second.to_i
                 else
                   flag=false
                 end
               else
                 if a1=="" && a2!=""

                   if tmpv<=va.second.to_i

                   else
                     flag=false
                   end
                 else
                   if a1!="" && a2==""
                     if tmpv>=va.first.to_i
                     else
                       flag=false
                     end
                   else

                   end
                end
              end
            end
          end
          if flag
            @products.push(e)
          end
       end
     else
       @products=@matches
     end
     @products=@products.uniq
    respond_to do |format|
      format.js{}
    end
  end
  def search
    @search=params[:search]
    categories=Category.all
    @matches=Array.new
    @products=Array.new
    categories.each do |cat|
      cat.products.each do |p|
        if p.name.include?(@search)
          @products.push(p)
          @matches.push(cat)
        end
      end
    end
    #
    @matches=@matches.uniq
    @products=@products.uniq
    if @matches.count==1
      redirect_to controller:'categories',action:'show',id:@matches.first.id,search:@search
    end
    respond_to do |format|
      format.html{}
      format.js{}
    end
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
