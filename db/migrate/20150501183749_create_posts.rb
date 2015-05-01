class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content, limit: 141

      t.timestamps null: false

      t.references :users
    end
  end
end
