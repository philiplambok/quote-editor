class CreateTodos < ActiveRecord::Migration[7.0]
  def change
    create_table :todos do |t|
      t.references :date_note, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
