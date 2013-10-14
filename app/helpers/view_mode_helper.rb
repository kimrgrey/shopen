module ViewModeHelper
  def view_mode_item(id, href, css, active)
    content_tag :a, content_tag(:i, '', class: "#{css} #{'icon-white' if active}"), {href: href, id: id, class: "btn #{'btn-success' if active}"}
  end
end