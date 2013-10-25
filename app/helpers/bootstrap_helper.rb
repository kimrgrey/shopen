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
    
    content_tag :div, content_tag(:div, content_tag(:div, raw(flash_messages.join("\n")), class: 'offset1 span10'), class: 'row'), class: 'container'
  end

  def breadcrumb(*opts)
    devider = content_tag(:span, '/', class: 'divider')
    tags = opts.map do |title, path|
      if path
        content_tag(:li, content_tag(:a, title, href: path) + devider)  
      else
        content_tag(:li, title, class: 'active')
      end
      
    end
    content_tag(:ul, raw(tags.join), class: 'breadcrumb')
  end

  class Tabs < Struct.new(:view, :tabs)
    delegate :raw, :to => :view
    delegate :content_tag, :to => :view

    def tab(id, name, options = {:active => false}, &block)
      tabs << {:id => id, :name => name, :options => options }
      content_tag :div, :id => "#{id}-tab-content", :class => "tab-pane fade" + (options[:active] ? " in active" : ""), &block
    end
  end

  def tabs(id, &block)
    tabs = []
    content = capture(Tabs.new(self, tabs), &block)
    result = ""
    result += content_tag :ul, :id => "#{id}-tabs", :class => "nav nav-tabs" do 
      tags = tabs.map  do |tab| 
        link_tag = content_tag :a, tab[:name], :href => "##{tab[:id]}-tab-content", :data => { :toggle => "tab" }
        raw content_tag :li, link_tag, :class => ("active" if tab[:options][:active])
      end
      raw tags.join("\n")
    end
    result += content_tag :div, content, :class => "tab-content"
    raw result
  end
end