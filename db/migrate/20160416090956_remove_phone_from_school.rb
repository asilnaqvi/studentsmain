class RemovePhoneFromSchool < ActiveRecord::Migration
  def change
    remove_column :schools, :phone, :integer
  end
end
