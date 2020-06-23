class DemandsController < ApplicationController
  before_action :set_demand, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search]  # esto es cuando se hace la busqueda
      @demands = Demand.joins(:demander).where("users.last_name ILIKE ? or users.first_name ILIKE ? or description ILIKE ? ", "%#{params[:search]}%", "%#{params[:search]}%", "%#{params[:search]}%")    
    else # esto es cuando se cargan todos los eventos
      @demands = Demand.all
    end
    @current_user_demands = current_user.demanded
  end

  # GET /demands/1
  # GET /demands/1.json
  def show
    @users = User.all
    @products = Product.all
  end

  # GET /demands/new
  def new
    @user = current_user
    @demand = Demand.new
  end


  # GET /demands/1/edit
  def edit
  end

  # POST /demands
  # POST /demands.json
  def create
    @demand = Demand.new(demand_params)

    respond_to do |format|
      if @demand.save
        format.html { redirect_to @demand, notice: 'Demand was successfully created.' }
        format.json { render :show, status: :created, location: @demand }
      else
        format.html { render :new }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /demands/1
  # PATCH/PUT /demands/1.json
  def update
    respond_to do |format|
      if @demand.update(demand_params)
        format.html { redirect_to @demand, notice: 'Demand was successfully updated.' }
        format.json { render :show, status: :ok, location: @demand }
      else
        format.html { render :edit }
        format.json { render json: @demand.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /demands/1
  # DELETE /demands/1.json
  def destroy
    @demand.destroy
    respond_to do |format|
      format.html { redirect_to demands_url, notice: 'Demand was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_demand
      @demand = Demand.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def demand_params
      params.require(:demand).permit(:product_id, :requested_amount, 
        :description, :expiry_at).merge(demander_id: current_user.id, supplied_amount: 0, promised_amount:0 )
    end
end
