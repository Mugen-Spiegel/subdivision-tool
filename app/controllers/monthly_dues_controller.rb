class MonthlyDuesController < ApplicationController
  before_action :set_monthly_due, only: %i[ show edit update destroy ]

  # GET /monthly_dues or /monthly_dues.json
  def index
    @monthly_dues = MonthlyDue.all
  end

  # GET /monthly_dues/1 or /monthly_dues/1.json
  def show
  end

  # GET /monthly_dues/new
  def new
    @monthly_due = MonthlyDue.new
  end

  # GET /monthly_dues/1/edit
  def edit
  end

  # POST /monthly_dues or /monthly_dues.json
  def create
    @monthly_due = MonthlyDue.new(monthly_due_params)

    respond_to do |format|
      if @monthly_due.save
        format.html { redirect_to monthly_due_url(@monthly_due), notice: "Monthly due was successfully created." }
        format.json { render :show, status: :created, location: @monthly_due }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monthly_due.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_dues/1 or /monthly_dues/1.json
  def update
    respond_to do |format|
      if @monthly_due.update(monthly_due_params)
        format.html { redirect_to monthly_due_url(@monthly_due), notice: "Monthly due was successfully updated." }
        format.json { render :show, status: :ok, location: @monthly_due }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monthly_due.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_dues/1 or /monthly_dues/1.json
  def destroy
    @monthly_due.destroy!

    respond_to do |format|
      format.html { redirect_to monthly_dues_url, notice: "Monthly due was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_due
      @monthly_due = MonthlyDue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monthly_due_params
      params.require(:monthly_due).permit(:amount, :subdivision_id)
    end
end
