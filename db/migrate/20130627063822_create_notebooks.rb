class CreateNotebooks < ActiveRecord::Migration
  def change
    create_table :notebooks do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
    add_index :notebooks, [:user_id, :created_at]
  end
end
