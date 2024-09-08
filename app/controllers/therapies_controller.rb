class TherapiesController < ApplicationController
  before_action :set_therapy, only: %i[ show edit update destroy ]

  # GET /therapies or /therapies.json
  def index
    @therapies = current_user.therapies
  end

  # GET /therapies/1 or /therapies/1.json
  def show
  end

  # GET /therapies/new
  def new
    @therapy = Therapy.new
  end

  # GET /therapies/1/edit
  def edit
  end

  # POST /therapies or /therapies.json
  def create
    @therapy = Therapy.new(therapy_params)

    respond_to do |format|
      if @therapy.save
        format.html { redirect_to therapy_url(@therapy), notice: "Therapy was successfully created." }
        format.json { render :show, status: :created, location: @therapy }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @therapy.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /therapies/1 or /therapies/1.json
  def update
    respond_to do |format|
      if @therapy.update(therapy_params)
        format.html { redirect_to therapy_url(@therapy), notice: "Therapy was successfully updated." }
        format.json { render :show, status: :ok, location: @therapy }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @therapy.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /therapies/1 or /therapies/1.json
  def destroy
    @therapy.destroy!

    respond_to do |format|
      format.html { redirect_to therapies_url, notice: "Therapy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_therapy
      @therapy = Therapy.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def therapy_params
      params.require(:therapy).permit(:user_id, :therapist_id, :started_at, :completed_at)
    end
end
