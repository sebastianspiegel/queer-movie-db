class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :account_type #admin or user
      t.string :password_digest 
    end
  end
end
