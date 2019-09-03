class Topic < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :guides, dependent: :destroy
end
