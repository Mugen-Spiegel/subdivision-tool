class SubdivisionsController < ApplicationController
  before_action :set_subdivision, only: %i[ show edit update destroy users water_billing_transaction]
  
  include Pagy::Backend

  # GET /subdivisions or /subdivisions.json
  def index
    @subdivisions = Subdivision.all
  end

  # GET /subdivisions/r1 or /subdivisions/1.json
  def show
  end

  # GET /subdivisions/new
  def new
    @subdivision = Subdivision.new
  end

  # GET /subdivisions/1/edit
  def edit
  end

  # POST /subdivisions or /subdivisions.json
  def create
    @subdivision = Subdivision.new(subdivision_params)

    respond_to do |format|
      if @subdivision.save
        format.html { redirect_to subdivision_url(@subdivision), notice: "Subdivision was successfully created." }
        format.json { render :show, status: :created, location: @subdivision }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subdivision.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /subdivisions/1 or /subdivisions/1.json
  def update
    respond_to do |format|
      if @subdivision.update(subdivision_params)
        format.html { redirect_to subdivision_url(@subdivision), notice: "Subdivision was successfully updated." }
        format.json { render :show, status: :ok, location: @subdivision }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subdivision.errors, status: :unprocessable_entity }
      end
    end
  end

  def water_billing_transaction
    @transaction = WaterBillingTransactionRepository.new(params)
    if params[:query].present?
      @pagy, @transaction = pagy((@transaction.search_water_billing_transaction))
    else
      @pagy, @transaction = pagy((@transaction.search_water_billing_transaction))
    end

  end

  # DELETE /subdivisions/1 or /subdivisions/1.json
  def destroy
    @subdivision.destroy!

    respond_to do |format|
      format.html { redirect_to subdivisions_url, notice: "Subdivision was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subdivision
      @subdivision = Subdivision.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subdivision_params
      params.require(:subdivision).permit(:name, :city, :postal_code)
    end
end
