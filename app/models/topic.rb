class Topic < ApplicationRecord
  validates :title, presence: true, uniqueness: true
end
