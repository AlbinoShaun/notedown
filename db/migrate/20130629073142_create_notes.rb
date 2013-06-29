class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.string :title
      t.string :content
      t.string :notebook_id

      t.timestamps
    end

    add_index :notes, [:notebook_id, :updated_at]
  end
end
