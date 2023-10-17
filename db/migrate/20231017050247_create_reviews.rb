class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :body
      t.string :star
      t.string :category
      t.integer :user_id
      t.timestamps
    end
  end
end
