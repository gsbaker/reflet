class NotesController < ApplicationController
  include Therapists::Restrictable

  before_action :authenticate_user!
  before_action :set_therapy

  def new
    @note = @therapy.notes.build(date: Date.today)
  end

  def create
    @note = @therapy.notes.build(note_params)

    if @note.save
      redirect_to therapy_path(@therapy)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @note = @therapy.notes.find(params[:id])
  end

  private

  def set_therapy
    @therapy = Therapy.find(params[:therapy_id])
  end

  def note_params
    params.require(:note).permit(:date, :content)
  end
end
