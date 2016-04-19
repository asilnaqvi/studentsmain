class AddColumnToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :admin_id, :integer
  end
end
