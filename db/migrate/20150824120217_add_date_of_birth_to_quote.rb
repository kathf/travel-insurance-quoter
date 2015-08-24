class AddDateOfBirthToQuote < ActiveRecord::Migration
  def change
    remove_column :quotes, :age, :integer
    remove_column :quotes, :trip_days, :integer
    add_column :quotes, :dob, :timestamp
    add_column :quotes, :trip_start, :timestamp
    add_column :quotes, :trip_end, :timestamp
  end
end
