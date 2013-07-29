module ApplicationHelper
  def title(*parts)
    unless parts.empty?
      content_for :title do
        (parts << "Mentor Mentee Matchmaking").join(" - ")
      end
    end
  end
end
