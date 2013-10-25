class MoneyInput < SimpleForm::Inputs::Base
  def input
    @builder.text_field(attribute_name, input_html_options)
  end

  def input_html_classes
    super.push('money')
  end
end