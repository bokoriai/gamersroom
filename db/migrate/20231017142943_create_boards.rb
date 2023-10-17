class CreateBoards < ActiveRecord::Migration[6.1]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :body
      t.references :user, foreign_key: true
      t.string :category
      
      t.timestamps
    end
  end
end
