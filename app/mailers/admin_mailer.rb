# frozen_string_literal: true

class AdminMailer < ApplicationMailer
  ADMIN = "george@reflet.io"

  def new_user_notification
    @user = params[:user]

    mail(
      to: ADMIN,
      subject: "New user registration on Reflet",
      from: "Reflet <notifications@reflet.io>"
    )
  end
end
