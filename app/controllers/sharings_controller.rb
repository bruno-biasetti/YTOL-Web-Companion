class SharingsController < ApplicationController
  before_action :set_sharing, only: [:show, :edit, :update, :destroy]

  # GET /sharings
  def index
    @sharings = current_user.sharings
  end

  # GET /sharings/1
  def show
  end

  # GET /sharings/new
  def new
    @sharing = Sharing.new
  end

  # GET /sharings/1/edit
  def edit
  end

  # POST /sharings
  def create
    @sharing = Sharing.new(sharing_params)
    @sharing.user = current_user

    if @sharing.save
      flash[:notice] = 'Sharing was successfully created.'
      redirect_to sharings_path(locale: locale)
    else
      render :new
    end
  end

  # PATCH/PUT /sharings/1
  def update
    if @sharing.update(sharing_params)
      flash[:notice] = 'Sharing was successfully updated.'
      redirect_to sharings_path(locale: locale)
    else
      render :edit
    end
  end

  # DELETE /sharings/1
  def destroy
    @sharing.destroy

    redirect_to sharings_url, notice: 'Sharing was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sharing
      @sharing = Sharing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sharing_params
      params.require(:sharing).permit(:spiritual_life, :god_relationship, :family_relationship, :testimony_to_society)
    end
end
