class Guide < ApplicationRecord
  has_rich_text :content
  has_one_attached :featured_image

  include PgSearch::Model
  pg_search_scope :search_by_term,
    against: [:title],
    associated_against: {
      topic: [:title],
      rich_text_content: [:body]
    },
    using: {
      tsearch: {
        any_word: true,
        prefix: true
      }
    }

  belongs_to :topic
  belongs_to :user

  validates :title, length: { minimum: 3, maximum: 150 }, allow_blank: false

  enum status: [
    :draft,
    :published
  ]
end
