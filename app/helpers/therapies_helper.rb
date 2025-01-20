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
      therapy_needs_record_path(@therapy, needs_record)
    end
  end

  def therapy_nav_link_for(url:, text:)
    link_to text, url, class: "therapy-nav-link #{"therapy-nav-link-active" if request.fullpath.start_with?(url)}"
  end
end
