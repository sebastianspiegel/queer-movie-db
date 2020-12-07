class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :network
      t.string :imdb_url
      t.string :year
      t.text :summary
      t.integer :user_id
    end
  end
end

# title, imdb_url, year, summary, network