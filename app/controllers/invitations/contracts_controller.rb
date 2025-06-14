# frozen_string_literal: true

module Invitations
  class ContractsController < ApplicationController
    before_action :set_invitation

    def show
    end

    def accept
      @invitation.update! contract_accepted_at: DateTime.current
      login @invitation.invitee
      redirect_to root_path
    end

    private

    def set_invitation
      @invitation = Invitation.find(params[:invitation_id])
    end
  end
end
