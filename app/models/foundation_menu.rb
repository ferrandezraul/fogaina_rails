class FoundationMenu < Refinery::Pages::MenuPresenter

  private

  def render_menu(items)
    content_tag(:section, :class => 'top-bar-section') do
      render_menu_items(items)
    end
  end

  def render_menu_items(menu_items)
    if menu_items.present?
      list_tag_css << ' right'
      content_tag(list_tag, :class => list_tag_css) do
        menu_items.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
          buffer << render_menu_item(item, index)
        end
      end
    end
  end

  def render_menu_item_link(menu_item)
    link_to(menu_item.title, context.refinery.url_for(menu_item.url))
  end
end