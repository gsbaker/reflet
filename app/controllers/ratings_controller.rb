class RatingsController < ApplicationController
  def index
    @rating = Rating.where(user: current_user, status: :unknown).first
  end

  def update
    @rating = current_user.ratings.find params[:id]
    @rating.update(status: rating_params[:status])

    @rating = Rating.where(user: current_user, status: :unknown).first

    respond_to do |format|
      format.turbo_stream do
        render
      end
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:status)
  end
end
