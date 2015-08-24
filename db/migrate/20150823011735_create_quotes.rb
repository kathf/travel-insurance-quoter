class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.references :policy
      t.integer :age
      t.integer :trip_days
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
