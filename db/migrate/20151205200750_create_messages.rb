class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :title, null: false
      t.text :content, null: false
      t.integer :user_id, index: true, foreign_key: true, null: false
      
      t.timestamps null: false
    end
  end
end
