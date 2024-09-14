class ClientsController < ApplicationController
  include Therapists::Restrictable

  before_action :authenticate_user!

  def index
    @clients = current_user.clients
    @sent_invitations = current_user.sent_invitations
  end

  def show
    @client = current_user.clients.find(params[:id])
  end
end
