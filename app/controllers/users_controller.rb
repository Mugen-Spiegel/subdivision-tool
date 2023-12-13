class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.includes(:address).all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @address = Subdivision.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.create(
      first_name: user_params[:first_name],
      middle_name: user_params[:middle_name],
      last_name: user_params[:last_name],
      email: user_params[:email],
      subdivision_id: Subdivision.first.id
    )
    Address.create!(
      block: user_params[:block],
      lot: user_params[:lot],
      street: user_params[:street],
      user_id: @user.id
    )

    respond_to do |format|
      unless @user.nil?
        @user
        format.html { redirect_to users_path(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.includes(:address, :subdivision).find(user_id)
    end

    def user_id
      params[:user_id] | params[:id]
    end


    def set_subdivision
      @subdivision = Subdivision.find(params[:subdivision_id])
    end
    
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:first_name, :middle_name, :last_name, :email, :password, :block, :lot, :street)
    end
end
