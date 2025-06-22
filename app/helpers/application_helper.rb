module ApplicationHelper
  def avatar_path(user = current_user)
    if user.avatar.attached?
      user.avatar.variant(:thumb)
    elsif user.therapist?
      image_path("avatar-therapist.svg")
    else
      image_path("avatar-client.svg")
    end
  end
end
