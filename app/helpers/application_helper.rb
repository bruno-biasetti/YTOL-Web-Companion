module ApplicationHelper

  def partial_locale
    locale.to_s.sub '-', '_'
  end

end
