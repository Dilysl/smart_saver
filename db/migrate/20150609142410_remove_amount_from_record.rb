class RemoveAmountFromRecord < ActiveRecord::Migration
  def change
    remove_column :records, :amount, :float
  end
end
