class TherapiesController < ApplicationController
  before_action :set_therapy, only: %i[ show edit update destroy upload_attachments ]

  def index
    @therapies = current_user.therapies
  end

  def show
  end

  def new
    @therapy = Therapy.new
  end

  def edit
  end

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

  def upload_attachments
    @therapy.assign_attributes(therapy_params)

    @therapy.attachments.each do |attachment|
      attachment.uploaded_by_id ||= current_user.id
    end

    respond_to do |format|
      if @therapy.save
        format.turbo_stream { render :upload_attachments }
        format.html { redirect_to therapy_url(@therapy) }
      else
        render :show, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @therapy.destroy!

    respond_to do |format|
      format.html { redirect_to therapies_url, notice: "Therapy was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_therapy
    @therapy = current_user.therapies.find(params[:id])
  end

  def therapy_params
    params.require(:therapy).permit(:completed_at, attachments: [])
  end
end
