module PriceHelper
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