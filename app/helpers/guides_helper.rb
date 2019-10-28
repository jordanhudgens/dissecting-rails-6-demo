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

  def guide_actions guide
    if current_user && guide.user == current_user
      edit_link = content_tag :div, class: "action-icon" do
        link_to inline_svg('settings-icon.svg', class: 'nav-icon'), edit_guide_path(guide)
      end

      delete_link = content_tag :div, class: "action-icon" do
        link_to guide, method: :delete, data: { confirm: "Are you sure you want to delete this guide?" } do
          inline_svg('x-icon.svg', class: 'nav-icon')
        end
      end

      content_tag :div, class: "guide-actions" do
        edit_link + delete_link
      end
    end
  end
end
