class AddDaysLeftToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :days_left, :integer
    add_index :todos, :days_left
  end
end
