class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title
      t.string :genre
      t.string :year
      t.text :summary
      t.integer :user_id
    end
  end
end
