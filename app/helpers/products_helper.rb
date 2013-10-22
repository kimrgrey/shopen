module ProductsHelper
  DEFAULT_IMAGE_OPTIONS = { :size => :small }

  def product_image(product, options = DEFAULT_IMAGE_OPTIONS)
    content_tag(:a, content_tag(:img, nil, src: image_url("product-l1.jpg")), href: product_path(product))      
  end

  def product_sale_ribbon(product)
    content_tag(:span, "Sale", class: 'sale')
  end

  def product_price(product)
    if product.has_discount?
      [
        content_tag(:span, humanized_money_with_symbol(product.base_price), class: 'oldprice'), 
        content_tag(:span, humanized_money_with_symbol(product.discount_price), class: 'newprice')
      ].join('\n')
    else
      content_tag(:span, humanized_money_with_symbol(product.base_price), class: 'newprice')
    end
  end
end