class Article < ApplicationRecord
  has_rich_text :content

  validates :title, :content, :published_at, :slug, presence: true
  validates :title, :slug, uniqueness: true

end
