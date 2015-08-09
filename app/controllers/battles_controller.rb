class BattlesController < ApplicationController
  before_action :set_battle, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /battles
  # GET /battles.json
  def index
    @battles = Battle.all
  end

  # GET /battles/1
  # GET /battles/1.json
  def show
  end

  # GET /battles/new
  def new
    @battle = Battle.new
    ankle_first_id = Ankle.first.id
    ankle_last_id = Ankle.last.id
    if ankle_last_id >= 2
      rand_id_a = rand(ankle_first_id..ankle_last_id)
      rand_id_b = rand(ankle_first_id..ankle_last_id)
      rand_id_b = rand(ankle_first_id..ankle_last_id) while rand_id_a == rand_id_b
      @ankle_a = Ankle.find(rand_id_a)
      @ankle_b = Ankle.find(rand_id_b)
    else
      redirect_to root_path
    end

  end

  # GET /battles/1/edit
  def edit
  end

  # POST /battles
  # POST /battles.json
  def create
    @battle = Battle.new(battle_params)
    if params[:a]
      @battle.win_ankle_id = params[:ankle_a_id]
      @battle.lose_ankle_id = params[:ankle_b_id]
    else
      @battle.win_ankle_id = params[:ankle_b_id]
      @battle.lose_ankle_id = params[:ankle_a_id]
    end
    @battle.user = current_user
    respond_to do |format|
      if @battle.save_with_cal
        format.html { redirect_to @battle, notice: 'Battle was successfully created.' }
        format.json { render :show, status: :created, location: @battle }
      else
        format.html { render :new }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /battles/1
  # PATCH/PUT /battles/1.json
  def update
    respond_to do |format|
      if @battle.update(battle_params)
        format.html { redirect_to @battle, notice: 'Battle was successfully updated.' }
        format.json { render :show, status: :ok, location: @battle }
      else
        format.html { render :edit }
        format.json { render json: @battle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /battles/1
  # DELETE /battles/1.json
  def destroy
    @battle.destroy
    respond_to do |format|
      format.html { redirect_to battles_url, notice: 'Battle was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_battle
    @battle = Battle.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def battle_params
   # params.require(:battle).permit(:win_ankle_id, :lose_ankle_id, :user_id)
  end
end
