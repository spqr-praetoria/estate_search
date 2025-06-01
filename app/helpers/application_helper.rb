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
end
