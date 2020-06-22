class AllocationsController < ApplicationController
  before_action :set_allocation, only: [:show, :edit, :update, :destroy]

  # GET /allocations
  # GET /allocations.json
  def index
    @allocations = Allocation.all
    @demands = Demand.all
  end

  # GET /allocations/1
  # GET /allocations/1.json
  def show
    @demands = Demand.all
  end

  # GET /allocations/new
  def new
    @allocation = Allocation.new
    @demand_id = params[:id]
    @demand = Demand.find(@demand_id)

  end

  # GET /allocations/1/edit
  def edit
  end

  # POST /allocations
  # POST /allocations.json
  def create
    @allocation = Allocation.new(allocation_params)
    @demands = Demand.all
    @pa = @demands.find(@allocation.demand_id)
    respond_to do |format|
      if @allocation.save
        @pa.promised_amount += @allocation.amount
        @pa.save
        format.html { redirect_to @pa, notice: 'Allocation was successfully created.' }
        format.json { render :show, status: :created, location: @allocation }
      else
        format.html { render :new }
        format.json { render json: @allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /allocations/1
  # PATCH/PUT /allocations/1.json
  def update
    respond_to do |format|
      if @allocation.update(allocation_params)
        format.html { redirect_to @allocation, notice: 'Allocation was successfully updated.' }
        format.json { render :show, status: :ok, location: @allocation }
      else
        format.html { render :edit }
        format.json { render json: @allocation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /allocations/1
  # DELETE /allocations/1.json
  def destroy
    @allocation.destroy
    respond_to do |format|
      format.html { redirect_to allocations_url, notice: 'Allocation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_allocation
      @allocation = Allocation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def allocation_params
      params.require(:allocation).permit(:amount, :status, :promised_at, :demand_id).merge(
         user_id: current_user.id)
    end
end
