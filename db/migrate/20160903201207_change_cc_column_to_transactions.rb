class ChangeCcColumnToTransactions < ActiveRecord::Migration[5.0]
  def change
    remove_column :transactions, :credit_card_number
    add_column :transactions, :credit_card_number, :integer, limit: 8
  end
end
