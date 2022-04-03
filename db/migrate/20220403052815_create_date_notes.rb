class CreateDateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :date_notes do |t|
      t.date :date
      t.references :note, null: false, foreign_key: true

      t.timestamps
    end
    add_index :date_notes, :date
  end
end
