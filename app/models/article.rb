class Article < ApplicationRecord
  has_rich_text :content

  validates :title, :body, :publised_at, :slug, presence: true
  validates :title, :slug, uniqueness: true

end
