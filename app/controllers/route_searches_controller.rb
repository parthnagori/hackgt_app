class RouteSearchesController < ApplicationController
  before_action :set_route_search, only: [:show, :edit, :update, :destroy]

  # GET /route_searches
  # GET /route_searches.json
  def index
    @route_searches = RouteSearch.all
  end

  # GET /route_searches/1
  # GET /route_searches/1.json
  def show
  end

  # GET /route_searches/new
  def new
    @route_search = RouteSearch.new
  end

  # GET /route_searches/1/edit
  def edit
  end

  # POST /route_searches
  # POST /route_searches.json
  def create
    @route_search = RouteSearch.new(route_search_params)

    respond_to do |format|
      if @route_search.save
        format.html { redirect_to @route_search, notice: 'Route search was successfully created.' }
        format.json { render :show, status: :created, location: @route_search }
      else
        format.html { render :new }
        format.json { render json: @route_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /route_searches/1
  # PATCH/PUT /route_searches/1.json
  def update
    respond_to do |format|
      if @route_search.update(route_search_params)
        format.html { redirect_to @route_search, notice: 'Route search was successfully updated.' }
        format.json { render :show, status: :ok, location: @route_search }
      else
        format.html { render :edit }
        format.json { render json: @route_search.errors, status: :unprocessable_entity }
      end
    end
  end

  def suggest_route

  end

  def best_route
    puts "\n*"*10
    # puts params["legs"]
    puts "\n*"*10
    # puts params.keys
    puts "\n*"*10
    best_route = {}
    best_route = RouteSearch.get_best_route(params["legs"])
    respond_to do |format|
      format.json  { render :json => best_route }
    end
  end

  # DELETE /route_searches/1
  # DELETE /route_searches/1.json
  def destroy
    @route_search.destroy
    respond_to do |format|
      format.html { redirect_to route_searches_url, notice: 'Route search was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route_search
      # @route_search = RouteSearch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def route_search_params
      params.require(:route_search).permit(:Source, :Destination)
    end
end
