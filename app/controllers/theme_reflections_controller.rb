class ThemeReflectionsController < ApplicationController
  before_action :set_theme_reflection, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /theme_reflections
  def index
    @theme_reflections = current_user.theme_reflections
  end

  # GET /theme_reflections/1
  def show
  end

  # GET /theme_reflections/new
  def new
    @theme_reflection = ThemeReflection.new
  end

  # GET /theme_reflections/1/edit
  def edit
  end

  # POST /theme_reflections
  def create
    @theme_reflection = ThemeReflection.new(theme_reflection_params)
    @theme_reflection.user = current_user

    if @theme_reflection.save
      flash[:notice] = 'Theme reflection was successfully created.'
      redirect_to theme_reflections_path(locale: locale)
    else
      render :new
    end
  end

  # PATCH/PUT /theme_reflections/1
  def update
    if @theme_reflection.update(theme_reflection_params)
      flash[:notice] = 'Theme reflection was successfully updated.'
      redirect_to theme_reflections_path(locale: locale)
    else
      render :edit
    end
  end

  # DELETE /theme_reflections/1
  def destroy
    @theme_reflection.destroy

    redirect_to theme_reflections_url, notice: 'Theme reflection was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_theme_reflection
      @theme_reflection = ThemeReflection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def theme_reflection_params
      params.require(:theme_reflection).permit(:question)
    end
end
