class AddSortNameToSubjects < ActiveRecord::Migration
  def change
    add_column :subjects, :sort_name, :string
  end
end
