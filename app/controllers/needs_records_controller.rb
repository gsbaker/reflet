class NeedsRecordsController < ApplicationController
  before_action :set_needs_record, only: %i[ show edit update destroy ]

  # GET /needs_records or /needs_records.json
  def index
    @needs_records = current_user.needs_records
  end

  # GET /needs_records/1 or /needs_records/1.json
  def show
    @rating = @needs_record.ratings.unrated.first
  end

  # GET /needs_records/new
  def new
    @needs_record = current_user.needs_records.build
    @rating = @needs_record.ratings.first
  end

  # GET /needs_records/1/edit
  def edit
  end

  # POST /needs_records or /needs_records.json
  def create
    @needs_record = current_user.needs_records.build

    respond_to do |format|
      if @needs_record.save
        format.html { redirect_to needs_record_url(@needs_record), notice: "needs_record was successfully created." }
        format.json { render :show, status: :created, location: @needs_record }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @needs_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /needs_records/1 or /needs_records/1.json
  def update
    respond_to do |format|
      if @needs_record.update(needs_record_params)
        format.html { redirect_to needs_record_url(@needs_record), notice: "needs_record was successfully updated." }
        format.json { render :show, status: :ok, location: @needs_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @needs_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /needs_records/1 or /needs_records/1.json
  def destroy
    @needs_record.destroy!

    respond_to do |format|
      format.html { redirect_to needs_records_url, notice: "needs_record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_needs_record
      @needs_record = current_user.needs_records.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def needs_record_params
      params.require(:needs_record).permit(:user_id)
    end
end
