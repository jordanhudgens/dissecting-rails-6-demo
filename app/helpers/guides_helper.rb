module GuidesHelper
  def guide_thumb guide
    if guide.featured_image.attached?
      image_tag(guide.featured_image)
    else
      image_tag('placeholders/empty-thumb.png')
    end
  end

  def guide_banner guide
    if guide.featured_image.attached?
      image_tag(guide.featured_image, class: "guide-banner")
    end
  end

  def guide_timestamp guide
    formatted_time = distance_of_time_in_words(guide.created_at, Time.now)
    profile_link = link_to guide.user.username, profile_path(guide.user.username)
    "submitted #{formatted_time} ago by #{profile_link}".html_safe
  end
end
