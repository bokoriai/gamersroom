class AddGametitleToReview < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :game_title, :string
  end
end
