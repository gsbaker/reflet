module ApplicationHelper
  def avatar_path
    if current_user.avatar.attached?
      current_user.avatar.variant(:thumb)
    elsif current_user.therapist?
      image_path("avatar-therapist.svg")
    else
      image_path("avatar-client.svg")
    end
  end
end
