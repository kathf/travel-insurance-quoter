class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :quote
      t.string :user_reference
      t.integer :age
      t.integer :trip_days
      t.timestamp :quote_date
      t.timestamps null: false
    end
  end
end
