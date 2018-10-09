class ResourcesController < ApplicationController
  before_action :authenticate_admin!, only: [:new, :edit, :update, :destroy]
  before_action :set_resource, only: [:show, :edit, :update, :destroy]
  # GET /resources
  # GET /resources.json
  def index
    @admin = current_admin
    @categories = Category.all.map { |c| [c.category, c.id] }
    if params[:category].blank?
      @resources = Resource.search(params[:search]).order("created_at DESC").paginate(:per_page => 8, :page => params[:page])
    else
      filter_categories
    end
    gon.new_variable = @resources
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
  end
  def select_resources
    @resources = Resource.all
    render "resources", :resources => @resources
  end

  # GET /resources/new
  def new
    @resource = current_admin.resources.build
    @categories = Category.all.map { |c| [c.category, c.id] }
  end

  # GET /resources/1/edit
  def edit
    @categories = Category.all.map{ |c| [c.category, c.id] }
  end

  # POST /resources
  # POST /resources.json
  def create
    @resource = current_admin.resources.build(resource_params)
    @resource.category_id = params[:category_id]
    respond_to do |format|
      if @resource.save
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @resource }
      else
        format.html { render :new }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resources/1
  # PATCH/PUT /resources/1.json
  def update
    @resource.category_id = params[:category_id]
    respond_to do |format|
      if @resource.update(resource_params)
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @resource }
      else
        format.html { render :edit }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource.destroy
    respond_to do |format|
      format.html { redirect_to resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource
      @resource = Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def resource_params
      params.require(:resource).permit(:title, :description, :link, :category_id)
    end

    def filter_categories
      @category_id = Category.find_by(category: params[:category]).id
      @resources = Resource.where(category_id: @category_id).order("created_at DESC").paginate(:per_page => 8, :page => params[:page])
    end
end
