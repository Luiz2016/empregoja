class RemoveCategoryFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :category, :string
  end
end
