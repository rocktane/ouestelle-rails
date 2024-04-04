class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :tags
      t.text :content
      t.datetime :published_at
      t.string :slug
      t.text :summary
      t.string :status
      t.text :comments

      t.timestamps
    end
  end
end
