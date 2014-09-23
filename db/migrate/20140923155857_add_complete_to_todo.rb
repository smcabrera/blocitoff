class AddCompleteToTodo < ActiveRecord::Migration
  def change
    add_column :todos, :complete, :boolean
    add_index :todos, :complete
  end
end
