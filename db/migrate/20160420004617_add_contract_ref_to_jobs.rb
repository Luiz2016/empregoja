class AddContractRefToJobs < ActiveRecord::Migration
  def change
    add_reference :jobs, :contract, index: true, foreign_key: true
  end
end
