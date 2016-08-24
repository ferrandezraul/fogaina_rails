class FoundationMenu < Refinery::Pages::MenuPresenter

  private

  def render_menu(items)
    content_tag(:section, :class => 'top-bar-section') do
      render_menu_items(items)
    end
  end

  def render_menu_items(menu_items)
    if menu_items.present?
      content_tag(list_tag, :class => menu_list_tag_css(menu_items)) do
        menu_items.each_with_index.inject(ActiveSupport::SafeBuffer.new) do |buffer, (item, index)|
          buffer << render_menu_item(item, index)
        end
      end
    end
  end

  def render_menu_item(menu_item, index)
    content_tag(list_item_tag, :class => menu_item_css(menu_item, index)) do
      buffer = ActiveSupport::SafeBuffer.new
      buffer << render_menu_item_link(menu_item)
      buffer << render_menu_items(menu_item_children(menu_item))
      buffer
    end
  end

  def render_menu_item_link(menu_item)
    # Create a dummy link that does not link to anything,
    # in case it is a page with children pages and it is not the Home page.
    # This is done in order to avoid that parent pages
    # are clickable since it was not visible for all users (hack done in order to improve usuability)
    if menu_item.has_children? and menu_item.menu_match != "^/$"
      link_to(menu_item.title, "#") # Dummy link that does nothing
    else
      link_to(menu_item.title, context.refinery.url_for(menu_item.url))
    end
  end

  def menu_item_css(menu_item, index)
    css = []

    css << active_css if descendant_item_selected?(menu_item)
    css << selected_css if selected_item?(menu_item)
    css << first_css if index == 0
    css << last_css if index == menu_item.shown_siblings.length
    css << "has-dropdown" if menu_item.children.any? && within_max_depth?(menu_item)

    css.reject(&:blank?).presence
  end

  def menu_list_tag_css(menu_items)
    css = []

    has_parent = false

    css << 'right'

    menu_items.each do |item|
      # TODO Check also if item is not hidden as "home" page has a child page hidden that shouldn't show up
      if item.has_parent?
        has_parent = true
      end
    end

    # MenuPresenter is here
    # /home/chillout/.rvm/gems/ruby-2.2.1@fogaina/gems/refinerycms-pages-3.0.2/app/presenters/refinery/pages/menu_presenter.rb
    # MenuItem is here
    # /home/chillout/.rvm/gems/ruby-2.2.1@fogaina/gems/refinerycms-core-3.0.2/lib/refinery/menu_item.rb
    css << 'dropdown' if has_parent

    css.reject(&:blank?).presence
  end

end