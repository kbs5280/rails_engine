class AddColumnToTransactions < ActiveRecord::Migration[5.0]
  def change
    add_reference :transactions, :invoice, foreign_key: true
  end
end
