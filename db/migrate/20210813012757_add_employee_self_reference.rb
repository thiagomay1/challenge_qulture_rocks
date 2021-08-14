class AddEmployeeSelfReference < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :parent_id, :integer
    add_column :employees, :lft,       :integer
    add_column :employees, :rgt,       :integer

    add_index :employees, :parent_id
    add_index :employees, :lft
    add_index :employees, :rgt
  end
end
