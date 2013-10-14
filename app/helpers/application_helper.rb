module ApplicationHelper
  def view_mode_item(id, href, css, active)
    content_tag :a, content_tag(:i, '', class: "#{css} #{'icon-white' if active}"), {href: href, id: id, class: "btn #{'btn-success' if active}"}
  end

  def main_page_header(text)
    content_tag(:div, content_tag(:div, content_tag(:h1, content_tag(:span, text) , class: 'headingmain') , class: 'span12'), class: 'row')
  end
end
