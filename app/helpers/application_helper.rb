module ApplicationHelper
  def nl2br(text)
    safe_join(text.lines(chomp: true), tag.br)
  end
end
