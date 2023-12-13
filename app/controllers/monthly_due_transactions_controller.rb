class MonthlyDueTransactionsController < ApplicationController
  before_action :set_monthly_due_transaction, only: %i[ show edit update destroy ]

  # GET /monthly_due_transactions or /monthly_due_transactions.json
  def index
    monthly_due_transactions = MonthlyDueTransaction.includes([:user,:subdivision, :monthly_due]).all
    render json: monthly_due_transactions.to_json
  end

  # GET /monthly_due_transactions/1 or /monthly_due_transactions/1.json
  def show
  end

  # GET /monthly_due_transactions/new
  def new
    @monthly_due_transaction = MonthlyDueTransaction.new
  end

  # GET /monthly_due_transactions/1/edit
  def edit
  end

  # POST /monthly_due_transactions or /monthly_due_transactions.json
  def create
    @monthly_due_transaction = MonthlyDueTransaction.new(monthly_due_transaction_params)

    respond_to do |format|
      if @monthly_due_transaction.save
        format.html { redirect_to monthly_due_transaction_url(@monthly_due_transaction), notice: "Monthly due transaction was successfully created." }
        format.json { render :show, status: :created, location: @monthly_due_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @monthly_due_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_due_transactions/1 or /monthly_due_transactions/1.json
  def update
    respond_to do |format|
      if @monthly_due_transaction.update(monthly_due_transaction_params)
        format.html { redirect_to monthly_due_transaction_url(@monthly_due_transaction), notice: "Monthly due transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @monthly_due_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @monthly_due_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_due_transactions/1 or /monthly_due_transactions/1.json
  def destroy
    @monthly_due_transaction.destroy!

    respond_to do |format|
      format.html { redirect_to monthly_due_transactions_url, notice: "Monthly due transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_due_transaction
      @monthly_due_transaction = MonthlyDueTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def monthly_due_transaction_params
      params.require(:subdivision_id)
      params.permit(:user_id)
    end
end
