class AddPhonesToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :phone, :string
  end
end
