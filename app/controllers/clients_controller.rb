class ClientsController < ApplicationController
  before_action :authenticate_user!

  def index
    @clients = current_user.clients
    @sent_invitations = current_user.sent_invitations
  end
end
