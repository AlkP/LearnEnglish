class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.integer :parent_id
      t.integer :child_id

      t.timestamps
    end
    add_index :families, :parent_id,  unique: false
    add_index :families, :child_id,   unique: false
  end
end
