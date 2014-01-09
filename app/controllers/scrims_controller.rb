class ScrimsController < ApplicationController
  before_action :set_scrim, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /scrims
  # GET /scrims.json
  def index
    @scrims = Scrim.all
  end

  # GET /scrims/1
  # GET /scrims/1.json
  def show
  end

  # GET /scrims/new
  def new
    @scrim = current_user.scrims.build
  end

  # GET /scrims/1/edit
  def edit
  end

  # POST /scrims
  # POST /scrims.json
  def create
    @scrim = current_user.scrims.build(scrim_params)

    respond_to do |format|
      if @scrim.save
        format.html { redirect_to @scrim, notice: 'Scrim was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scrim }
      else
        format.html { render action: 'new' }
        format.json { render json: @scrim.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scrims/1
  # PATCH/PUT /scrims/1.json
  def update
    respond_to do |format|
      if @scrim.update(scrim_params)
        format.html { redirect_to @scrim, notice: 'Scrim was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scrim.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scrims/1
  # DELETE /scrims/1.json
  def destroy
    @scrim.destroy
    respond_to do |format|
      format.html { redirect_to scrims_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scrim
      @scrim = Scrim.find(params[:id])
    end

    def correct_user
      @pin = current_user.scrims.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this scrim" if @pin.nil?
    end  

    # Never trust parameters from the scary internet, only allow the white list through.
    def scrim_params
      params.require(:scrim).permit(:player, :mmr, :location, :date)
    end
end
