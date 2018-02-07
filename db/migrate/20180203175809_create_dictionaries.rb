class CreateDictionaries < ActiveRecord::Migration[5.1]
  def change
    create_table :dictionaries do |t|
      t.integer :language,    default: 0, null: false
      t.integer :vocabulary,  default: 0, null: false
      t.integer :category,    default: 0, null: false
      t.string  :word
      t.string  :translate

      t.timestamps
    end
  end
end
