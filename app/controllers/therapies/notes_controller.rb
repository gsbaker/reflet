module Therapies
  class NotesController < BaseController
    include Therapists::Restrictable

    def index
      @notes = @therapy.notes
    end

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

    def note_params
      params.require(:note).permit(:date, :content)
    end
  end
end
