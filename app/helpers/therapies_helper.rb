module TherapiesHelper
  def path_for_needs_record(current_user, needs_record)
    case current_user
    when Individual
      needs_record_path(needs_record)
    when Therapist
      therapy_needs_record_path(@therapy, needs_record)
    end
  end

  def therapy_nav_link_for(url:, title:, icon:)
    link_to url, class: "therapy-nav-link #{"therapy-nav-link-active" if request.fullpath.start_with?(url)}" do
      capture do
        concat image_tag "icons/#{icon}.svg", class: "icon"
        concat title
      end
    end
  end
end
