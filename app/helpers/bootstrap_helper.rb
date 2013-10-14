module BootstrapHelper
  ALERT_TYPES = [:error, :info, :success, :warning]

  def bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      # Skip empty messages, e.g. for devise messages set to nothing in a locale file.
      next if message.blank?
      
      type = :success if type == :notice
      type = :error if type == :alert
      next unless ALERT_TYPES.include?(type)

      Array(message).each do |msg|
        text = content_tag(:div,
                           content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                           msg.html_safe, :class => "alert fade in alert-#{type}")
        flash_messages << text if msg
      end
    end
    flash_messages.join("\n").html_safe
  end

  def breadcrumb(*opts)
    devider = content_tag(:span, '/', class: 'divider')
    tags = opts.map do |opt|
      if opt.size > 1 
        content_tag(:li, content_tag(:a, opt.last, href: opt.first) + devider)  
      else
        content_tag(:li, opt.first, class: 'active')
      end
      
    end
    content_tag(:ul, raw(tags.join), class: 'breadcrumb')
  end
end