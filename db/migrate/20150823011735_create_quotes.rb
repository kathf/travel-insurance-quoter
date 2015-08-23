class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.references :policy
      t.string :user_reference
      t.integer :age
      t.integer :trip_days
      t.timestamp :quote_date
      t.timestamps null: false
      t.timestamps null: false
    end
  end
end
