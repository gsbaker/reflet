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

  def path_for_needs_record(current_user, needs_record)
    case current_user
    when Individual
      needs_record_path(needs_record)
    when Therapist
      therapy_needs_record_path(needs_record)
    end
  end
end
