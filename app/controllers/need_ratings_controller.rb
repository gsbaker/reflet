class NeedRatingsController < ApplicationController
  before_action :set_rating, only: %i[update]

  def update
    if params[:need_rating].present? && @rating.update(rating_params)
      redirect_to needs_record_path(@rating.needs_record)
    else
      @needs_record = @rating.needs_record
      @rating.errors.add(:status, "can't be blank")
      render "needs_records/show", status: :unprocessable_entity
    end
  end

  private

  def set_rating
    @rating = NeedRating.find params[:id]
  end

  def rating_params
    params.require(:need_rating).permit(:status)
  end
end
