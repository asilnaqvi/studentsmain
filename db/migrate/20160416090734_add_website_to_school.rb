class AddWebsiteToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :website, :string
  end
end
