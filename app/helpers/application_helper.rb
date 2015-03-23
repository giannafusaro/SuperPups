module ApplicationHelper

  def icon_link(icon = nil, html_options = {}, &block)
    icon_text = html_options.delete(:icon_text)
    html_options.transform_keys! { |key| /data_(\w+)/ === key ? key.to_s.dasherize : key }
    content_tag(:a, nil, html_options) { content_tag(:i, icon_text, class: icon) }
  end

end
