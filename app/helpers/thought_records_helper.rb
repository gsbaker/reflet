module ThoughtRecordsHelper
  def path_for_thought_record(user, thought_record)
    case user
    when Individual
      thought_record_path(thought_record)
    when Therapist
      therapy_thought_record_path(@therapy, thought_record)
    end
  end
end
