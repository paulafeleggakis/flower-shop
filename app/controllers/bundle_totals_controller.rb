class BundleTotalsController < ApplicationController
  before_action :set_bundle_total, only: [:show, :edit, :update, :destroy]

  # GET /bundle_totals
  # GET /bundle_totals.json
  def index
    @bundle_totals = BundleTotal.all
  end

  # GET /bundle_totals/1
  # GET /bundle_totals/1.json
  def show
  end

  # GET /bundle_totals/new
  def new
    @bundle_total = BundleTotal.new
  end

  # GET /bundle_totals/1/edit
  def edit
  end

  # POST /bundle_totals
  # POST /bundle_totals.json
  def create
    @bundle_total = BundleTotal.new(bundle_total_params)

    respond_to do |format|
      if @bundle_total.save
        format.html { redirect_to @bundle_total, notice: 'Bundle total was successfully created.' }
        format.json { render :show, status: :created, location: @bundle_total }
      else
        format.html { render :new }
        format.json { render json: @bundle_total.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bundle_totals/1
  # PATCH/PUT /bundle_totals/1.json
  def update
    respond_to do |format|
      if @bundle_total.update(bundle_total_params)
        format.html { redirect_to @bundle_total, notice: 'Bundle total was successfully updated.' }
        format.json { render :show, status: :ok, location: @bundle_total }
      else
        format.html { render :edit }
        format.json { render json: @bundle_total.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bundle_totals/1
  # DELETE /bundle_totals/1.json
  def destroy
    @bundle_total.destroy
    respond_to do |format|
      format.html { redirect_to bundle_totals_url, notice: 'Bundle total was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bundle_total
      @bundle_total = BundleTotal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bundle_total_params
      params.require(:bundle_total).permit(:bundle_quantity, :bundle_size, :bundle_cost, :line_item_id)
    end
end
