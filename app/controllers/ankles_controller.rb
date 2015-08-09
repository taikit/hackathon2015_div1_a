class AnklesController < ApplicationController
  before_action :set_ankle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :only => [:create]  

  # GET /ankles
  # GET /ankles.json
  def index
    @ankles = Ankle.all
  end

  # GET /ankles/1
  # GET /ankles/1.json
  def show
      @comment = @ankle.comments.build
  end

  # GET /ankles/new
  def new
    @ankle = Ankle.new
  end

  # GET /ankles/1/edit
  def edit
  end

  # POST /ankles
  # POST /ankles.json
  def create
    @ankle = Ankle.new(ankle_params)
    @ankle.user_id = current_user

    respond_to do |format|
      if @ankle.save
        format.html { redirect_to @ankle, notice: 'Ankle was successfully created.' }
        format.json { render :show, status: :created, location: @ankle }
      else
        format.html { render :new }
        format.json { render json: @ankle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ankles/1
  # PATCH/PUT /ankles/1.json
  def update
    respond_to do |format|
      if @ankle.update(ankle_params)
        format.html { redirect_to @ankle, notice: 'Ankle was successfully updated.' }
        format.json { render :show, status: :ok, location: @ankle }
      else
        format.html { render :edit }
        format.json { render json: @ankle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ankles/1
  # DELETE /ankles/1.json
  def destroy
    @ankle.destroy
    respond_to do |format|
      format.html { redirect_to ankles_url, notice: 'Ankle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ankle
    	@ankle = Ankle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ankle_params
      #params.require(:ankle).permit(:id, :image)
      params.require(:ankle).permit(:image)
    end
end
