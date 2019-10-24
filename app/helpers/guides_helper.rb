module GuidesHelper
  def guide_thumb guide
    if guide.featured_image.attached?
      image_tag(guide.featured_image)
    else
      image_tag('placeholders/empty-thumb.png')
    end
  end
end
