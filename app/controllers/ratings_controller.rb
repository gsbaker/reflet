class RatingsController < ApplicationController
  before_action :set_rating, only: %i[update]

  # PATCH/PUT /ratings/1 or /ratings/1.json
  def update
    if @rating.update(rating_params)
      redirect_to needs_record_path(@rating.needs_record)
    else
      render "needs_records/show", status: :unprocessable_entity
    end
  end

  private

  def set_rating
    @rating = Rating.find(params[:id])
  end

  def rating_params
    params.require(:rating).permit(:needs_record_id, :need_id, :title)
  end
end
