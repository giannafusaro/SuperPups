module ApplicationHelper

  def bg(photo_url)
    "background-image: url(#{photo_url});"
  end

  def icon(icon, icon_text=nil)
    content_tag(:i, icon_text, class: "superpups-#{icon}")
  end

  def icon_link(icon = nil, html_options = {}, &block)
    icon_text = html_options.delete(:icon_text)
    html_options.transform_keys! { |key| /data_(\w+)/ === key ? key.to_s.dasherize : key }
    content_tag(:a, nil, html_options) { icon(icon, icon_text) }
  end

end
