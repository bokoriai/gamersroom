class CreateBoardthreads < ActiveRecord::Migration[6.1]
  def change
    create_table :boardthreads do |t|
      t.string :title
      t.text :body
      t.integer :user_id
      t.string :category
      t.integer :board_id
      t.timestamps
    end
  end
end
