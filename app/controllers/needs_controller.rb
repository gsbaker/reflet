class NeedsController < ApplicationController
  def index
    @needs = Need.all
    puts "needs: #{@needs}"
  end
end
