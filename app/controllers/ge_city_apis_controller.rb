class GeCityApisController < ApplicationController
  before_action :set_ge_city_api, only: [:show, :edit, :update, :destroy]

  # GET /ge_city_apis
  # GET /ge_city_apis.json
  def index
    @ge_asset_list = GeCityApi.get_asset_list
    @historical_data = GeCityApi.get_asset_historical_data
    @current_data = GeCityApi.get_asset_current_data(@historical_data.keys)
    @anomaly = GeCityApi.check_anomalies(@current_data, @historical_data)
    # @ge_city_apis = GeCityApi.all
  end

  # GET /ge_city_apis/1
  # GET /ge_city_apis/1.json
  def show
  end

  # GET /ge_city_apis/new
  def new
    @ge_city_api = GeCityApi.new
  end

  # GET /ge_city_apis/1/edit
  def edit
  end

  def live_feed
    @ge_asset_list = GeCityApi.get_asset_list
    @historical_data = GeCityApi.get_asset_historical_data
    @current_data = GeCityApi.get_asset_current_data(@historical_data.keys)
    @anomaly = GeCityApi.check_anomalies(@current_data, @historical_data)
    @feed_file = @anomaly.values.last
  end

  # POST /ge_city_apis
  # POST /ge_city_apis.json
  def create
    @ge_city_api = GeCityApi.new(ge_city_api_params)

    respond_to do |format|
      if @ge_city_api.save
        format.html { redirect_to @ge_city_api, notice: 'Ge city api was successfully created.' }
        format.json { render :show, status: :created, location: @ge_city_api }
      else
        format.html { render :new }
        format.json { render json: @ge_city_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ge_city_apis/1
  # PATCH/PUT /ge_city_apis/1.json
  def update
    respond_to do |format|
      if @ge_city_api.update(ge_city_api_params)
        format.html { redirect_to @ge_city_api, notice: 'Ge city api was successfully updated.' }
        format.json { render :show, status: :ok, location: @ge_city_api }
      else
        format.html { render :edit }
        format.json { render json: @ge_city_api.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ge_city_apis/1
  # DELETE /ge_city_apis/1.json
  def destroy
    @ge_city_api.destroy
    respond_to do |format|
      format.html { redirect_to ge_city_apis_url, notice: 'Ge city api was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ge_city_api
      # @ge_city_api = GeCityApi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ge_city_api_params
      params.fetch(:ge_city_api, {})
    end
end
