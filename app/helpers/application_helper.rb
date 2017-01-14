module ApplicationHelper
  def nav_item(text, path)
    content_tag :li, class: active_path?(path) do
      link_to text, path
    end
  end

  def icon(name, options = {})
    icon_class = "fa fa-#{name.to_s.dasherize}"
    icon_class += " #{options.delete(:class)}" if options.has_key?(:class)
    content_tag :i, nil, options.merge(class: icon_class)
  end

  def active_path?(url)
    return '' if url == :none
    'active' if path_only(url) == current_path
  end

  def current_path?(url)
    return path_only(url) == current_path
  end

  private

  def current_path
    path_only(request.original_url)
  end

  def path_only(url)
    URI.parse(url).path
  end
end
