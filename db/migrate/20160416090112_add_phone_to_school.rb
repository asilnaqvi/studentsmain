class AddPhoneToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :phone, :integer
  end
end
