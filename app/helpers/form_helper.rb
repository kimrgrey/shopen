module FormHelper
  def form_fieldset_header(title, description)
    raw [content_tag(:h3, title), content_tag(:p, description)].join()
  end
end