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

  class Carousel
    attr_accessor :view
    attr_accessor :counter

    delegate :raw, :to => :view
    delegate :content_tag, :to => :view

    def initialize(view)
      @counter = 0
      @view = view
    end

    def item(url, name, description)
      text = content_tag :div, raw(content_tag(:h4, name) + content_tag(:p, description)), class: 'carousel-caption'
      image = content_tag :img, '', src: url
      class_name = 'item'
      class_name += ' active' if counter == 0
      @counter += 1
      content_tag :div, raw(image + text), class: class_name
    end
  end

  def carousel(id, &block)
    c = Carousel.new(self)
    inner = content_tag :div, capture(c, &block), class: 'carousel-inner'
    items = (0...c.counter).map { |x| content_tag :li, '', data: {'slide-to' => x, 'target' => "##{id}"}, class: ('active' if x == 0) }.join()
    body = content_tag(:ol, raw(items), class: 'carousel-indicators') + inner
    if c.counter > 1
      body += content_tag :a, raw('&lsaquo;'), class: 'carousel-control left', data: {'slide' => 'prev'}, :href => "##{id}"
      body += content_tag :a, raw('&rsaquo;'), class: 'carousel-control right', data: {'slide' => 'next'}, :href => "##{id}"
    end
    content_tag :div, raw(body), id: id, class: 'carousel slide'
  end
end