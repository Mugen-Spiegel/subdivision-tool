class WaterBillingsController < ApplicationController
  before_action :set_water_billing, only: %i[ show edit update destroy ]

  # GET /water_billings or /water_billings.json
  def index
    @water_billings = WaterBillingRepository.new(params)
    @water_billings = @water_billings.search_water_billing
  end

  # GET /water_billings/1 or /water_billings/1.json
  def show
  end

  # GET /water_billings/new
  def new
    @water_billing = WaterBilling.new
  end

  # GET /water_billings/1/edit
  def edit
  end

  # POST /water_billings or /water_billings.json
  def create
    @water_billing =  WaterBillingRepository.new(water_billing_params)
    @water_billing.create

    respond_to do |format|
      unless @water_billing.nil?
        format.html { redirect_to water_billings_path({subdivision_id: water_billing_params["subdivision_id"],}), notice: "Water Billing was successfully created." }
        format.json { render :show, status: :created, location: @water_billing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @water_billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /water_billings/1 or /water_billings/1.json
  def update
    respond_to do |format|
      if @water_billing.update(water_billing_params)
        format.html { redirect_to subdivision_water_billings_path(@water_billing), notice: "Water billing was successfully updated." }
        format.json { render :show, status: :ok, location: @water_billing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @water_billing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_billings/1 or /water_billings/1.json
  def destroy
    @water_billing.destroy!

    respond_to do |format|
      format.html { redirect_to water_billings_url, notice: "Water billing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_billing
      @water_billing = WaterBilling.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def water_billing_params
      params.require(:water_billing).permit(
        :mother_meter_current_reading,
        :subdivision_id,
        :year,
        :month,
        :meter_image_link
      )
    end
end
