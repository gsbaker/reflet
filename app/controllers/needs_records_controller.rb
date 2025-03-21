class NeedsRecordsController < ApplicationController
  before_action :set_needs_record, only: %i[ show edit update destroy ]

  def index
    @needs_records = current_user.needs_records.select(&:persisted?)
    @needs_record = current_user.needs_records.build title: "Needs Record #{Date.today}"
  end

  def show
    @rating = @needs_record.ratings.where(status: nil).first

    if @rating.nil? && @needs_record.in_progress?
      @needs_record.completed!
    end

    @therapy = @needs_record.therapy if @needs_record.completed?
  end

  def create
    @needs_record = current_user.needs_records.build(needs_record_params)
    respond_to do |format|
      if @needs_record.save
        format.html { redirect_to needs_record_url @needs_record }
      else
        head :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /needs_records/1 or /needs_records/1.json
  def update
    respond_to do |format|
      if @needs_record.update(needs_record_params)
        format.html { redirect_to needs_record_url(@needs_record) }
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
      params.require(:needs_record).permit(:user_id, :therapy_id, :title)
    end
end
