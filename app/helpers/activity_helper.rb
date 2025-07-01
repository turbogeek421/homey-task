module ActivityHelper
  def header_for_activity(activity)
    case activity.record.class.name
    when "Comment"
      "Comment"
    when "StatusChange"
      "Status change"
    end
  end

  def display_for_activity(activity)
    case activity.record.class.name
    when "Comment"
      activity.record.content
    when "StatusChange"
      "from '#{activity.record.from_status}' to '#{activity.record.to_status}'"
    end
  end
end
