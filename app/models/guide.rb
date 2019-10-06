class Guide < ApplicationRecord
  has_rich_text :content
  has_one_attached :featured_image

  belongs_to :topic
  belongs_to :user

  validates :title, length: { minimum: 3, maximum: 150 }, allow_blank: false

  enum status: [
    :draft,
    :published
  ]
end
