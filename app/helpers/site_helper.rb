module SiteHelper

  def reviewer_details(reviewer)
    content_tag(:figure, nil, style: "background-image:url(#{reviewer[:photo_url]})") +
    content_tag(:figcaption, reviewer[:name])
  end

  def bg(photo_url)
    "background-image: url(#{photo_url});"
  end
end
