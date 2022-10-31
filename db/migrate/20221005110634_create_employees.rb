class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :f_name, :limit => 25
      t.string :l_name, :limit => 50
      t.string :email
      t.integer :phone, :limit => 12
      t.timestamps
    end
  end
end
