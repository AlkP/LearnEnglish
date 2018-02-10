class CreateDayDictionaries < ActiveRecord::Migration[5.1]
  def change
    create_table :day_dictionaries do |t|
      t.references :dictionary
      t.references :user

      t.date    :date
      t.integer :wrong,       default:  0,  null: false,  limit:  1
      t.integer :successful,  default:  0,  null: false,  limit:  1
    end
  end
end
