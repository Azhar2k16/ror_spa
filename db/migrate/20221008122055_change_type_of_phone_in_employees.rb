class ChangeTypeOfPhoneInEmployees < ActiveRecord::Migration[7.0]
  def up
    change_column :employees, :phone, :string
  end

    def down
    change_column :employees, :phone, :integer
  end
end
