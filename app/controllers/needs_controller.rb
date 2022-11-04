class NeedsController < ApplicationController
  before_action :require_login


  def index
    @needs = Need.all
    puts "needs: #{@needs}"
  end
end
