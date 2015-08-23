class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.integer :age_min
      t.integer :age_max
      t.integer :trip_days_min
      t.integer :trip_days_max
      t.money :price
      t.timestamp :effective_date
      t.timestamps null: false
    end
  end
end
