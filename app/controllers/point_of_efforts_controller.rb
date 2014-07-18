class PointOfEffortsController < ApplicationController
  before_action :set_point_of_effort, only: [:show, :edit, :update, :destroy]

  # GET /point_of_efforts
  # GET /point_of_efforts.json
  def index
    @point_of_efforts = PointOfEffort.all
  end

  # GET /point_of_efforts/1
  # GET /point_of_efforts/1.json
  def show
  end

  # GET /point_of_efforts/new
  def new
    @point_of_effort = PointOfEffort.new
  end

  # GET /point_of_efforts/1/edit
  def edit
  end

  # POST /point_of_efforts
  # POST /point_of_efforts.json
  def create
    @point_of_effort = PointOfEffort.new(point_of_effort_params)

    respond_to do |format|
      if @point_of_effort.save
        format.html { redirect_to @point_of_effort, notice: 'Point of effort was successfully created.' }
        format.json { render :show, status: :created, location: @point_of_effort }
      else
        format.html { render :new }
        format.json { render json: @point_of_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_of_efforts/1
  # PATCH/PUT /point_of_efforts/1.json
  def update
    respond_to do |format|
      if @point_of_effort.update(point_of_effort_params)
        format.html { redirect_to @point_of_effort, notice: 'Point of effort was successfully updated.' }
        format.json { render :show, status: :ok, location: @point_of_effort }
      else
        format.html { render :edit }
        format.json { render json: @point_of_effort.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_of_efforts/1
  # DELETE /point_of_efforts/1.json
  def destroy
    @point_of_effort.destroy
    respond_to do |format|
      format.html { redirect_to point_of_efforts_url, notice: 'Point of effort was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_of_effort
      @point_of_effort = PointOfEffort.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_of_effort_params
      params.require(:point_of_effort).permit(:title, :description, :due_date, :user_id)
    end
end
