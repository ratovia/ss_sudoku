class CreatePuzzles < ActiveRecord::Migration[6.0]
  def change
    create_table :puzzles do |t|
      t.string "answer", null: false
      t.string "question", null: false
      t.string "progress"
      t.timestamps
    end
  end
end
