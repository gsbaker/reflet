class TherapiesController < ApplicationController
  before_action :set_therapy, only: %i[ show edit update mark_completed mark_active ]

  def index
    @therapies = current_user.therapies
    @invitation = current_user.sent_invitations.build
  end

  def show
    if current_user.therapist?
      redirect_to therapy_notes_path(@therapy)
    else
      redirect_to therapy_assignments_path(@therapy)
    end
  end

  def new
    @therapy = Therapy.new
  end

  def edit
  end

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

  def mark_completed
    @therapy.mark_completed
    redirect_to therapy_url(@therapy), notice: "Therapy was successfully marked as completed."
  end

  def mark_active
    @therapy.mark_active
    redirect_to therapy_url(@therapy), notice: "Therapy was successfully marked as active."
  end

  private

  def set_therapy
    @therapy = current_user.therapies.find(params[:id])
  end

  def therapy_params
    params.require(:therapy).permit(:completed_at)
  end
end
