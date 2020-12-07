class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :title
      t.string :queerness 
      t.string :imdb_url
      t.string :year
      t.string :summary
      t.text :details 
      t.integer :user_id
    end
  end
end
