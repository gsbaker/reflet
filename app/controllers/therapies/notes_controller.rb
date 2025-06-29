module Therapies
  class NotesController < BaseController
    before_action :redirect_non_therapists

    def index
      @notes_by_month = @therapy.notes_by_month
    end

    def new
      @note = @therapy.notes.build(
        date: Time.zone.today,
        title: "Session #{@therapy.notes.count + 1}"
      )
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

    def edit
      @note = @therapy.notes.find(params[:id])
    end

    def update
      @note = @therapy.notes.find(params[:id])

      if @note.update!(note_params)
        redirect_to therapy_path(@therapy)
      else
        render :edit, status: :unprocessable_entity
      end
    end

    private

    def note_params
      params.require(:note).permit(:date, :content, :title)
    end
  end
end
