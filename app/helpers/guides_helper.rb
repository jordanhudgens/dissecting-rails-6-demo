module GuidesHelper
  def guide_thumb guide
    if guide.featured_image.attached?
      image_tag(guide.featured_image)
    else
      image_tag('placeholders/empty-thumb.png')
    end
  end

  def guide_timestamp guide
    "submitted #{distance_of_time_in_words(guide.created_at, Time.now) } ago by TODO".html_safe
  end
end
