class WaterBillingController < ApplicationController
    before_action :set_water_billing, only: %i[ show edit update destroy upload_image]
    # GET /water_billings or /water_billings.json
    def index
      @water_billings = WaterBillingRepository.new(params, current_user.subdivision_id)
      @water_billings = @water_billings.search_water_billing
      @total = {
        "current_reading": "N/A",
        "previous_reading": "N/A",
        "consumption": 0,
        "bill_amount": 0,
        "paid_amount": 0,
        "balance": 0,
      }
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
      @water_billing =  WaterBillingRepository.new(water_billing_params, current_user.subdivision_id)
      @water_billing.create
  
      respond_to do |format|
        unless @water_billing.nil?
          format.html { redirect_to water_billing_index_path({subdivision_id: water_billing_params["subdivision_id"],}), notice: "Water Billing was successfully created." }
          format.json { render :show, status: :created, location: @water_billing }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @water_billing.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # PATCH/PUT /water_billings/1 or /water_billings/1.json
    def update
      updates_billing_params = WaterBillingRepository.set_up_update_param(@water_billing, water_billing_params)
      respond_to do |format|
        if @water_billing.update!(updates_billing_params)
          format.html { redirect_to water_billing_index_path({subdivision_id: @water_billing.subdivision_id}), notice: "Water Billing was successfully updated." }
          format.json { render :show, status: :updated, location: @water_billing }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @water_billing.errors, status: :unprocessable_entity }
        end
      end
    end
  
    # DELETE /water_billings/1 or /water_billings/1.json
    def destroy
      @water_billing.destroy!
  
      respond_to do |format|
        format.html { redirect_to water_billing_index_path, notice: "Water billing was successfully destroyed." }
        format.json { head :no_content }
      end
    end
  
    def upload_image
      photo = @water_billing.photos.find_by(name: upload_image_params["name"])
      if photo.nil?
          @water_billing.photos.create(name: upload_image_params["name"], image: upload_image_params["image"])
      else
          photo.destroy
          @water_billing.photos.create(name: upload_image_params["name"], image: upload_image_params["image"])
      end
  
      respond_to do |format|
        unless @water_billing.nil?
          format.html { redirect_to water_billing_index_path({subdivision_id: @water_billing.subdivision_id}), notice: "Water Billing was successfully created." }
          format.json { render :show, status: :updated, location: @water_billing }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @water_billing.errors, status: :unprocessable_entity }
        end
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
          :bill_amount,
          :subdivision_id,
          :year,
          :month,
          :image,
          :paid_amount
        )
      end
  
      def upload_image_params
        params.require(:water_billing).permit(
          :name,
          :id,
          :image
        )
      end
  end
  