module TherapiesHelper
  def relation(current_user, therapy)
    case current_user
    when Individual
      content_tag :p do
        content_tag(:strong, "Therapist: ") + therapy.therapist.name
      end
    when Therapist
      content_tag :p do
        content_tag(:strong, "Client: ") + therapy.client.name
      end
    end
  end
end
