module ApplicationHelper
  def page_to(path, **options, &block)
    if current_page?(path)
      content_tag(:a, class: options[:class]) do
        block.call
      end
    else
      link_to(path, **options, &block)
    end
  end

  def format_pounds(amount)
    number_to_currency(amount, unit: "£", precision: 2)
  end
end
