class PointOfEffortsController < ApplicationController
  before_action :set_point_of_effort, only: [:show, :edit, :update, :destroy]

  # GET /point_of_efforts
  def index
    @point_of_efforts = current_user.point_of_efforts
  end

  # GET /point_of_efforts/1
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
  def create
    @point_of_effort = PointOfEffort.new(point_of_effort_params)
    @point_of_effort.user = current_user

    if @point_of_effort.save
      flash[:notice] = 'Point of Effort was successfully created.'
      redirect_to point_of_efforts_path(locale: locale)
    else
      render :new
    end
  end

  # PATCH/PUT /point_of_efforts/1
  def update
    if @point_of_effort.update(point_of_effort_params)
      flash[:notice] = 'Point of Effort was successfully updated.'
      redirect_to point_of_efforts_path(locale: locale)
    else
      render :edit
    end
  end

  # DELETE /point_of_efforts/1
  def destroy
    @point_of_effort.destroy

    redirect_to point_of_efforts_url, notice: 'Point of Effort was successfully destroyed.'
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
