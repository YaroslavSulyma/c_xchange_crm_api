class AddUidToTrades < ActiveRecord::Migration[8.0]
  def change
    add_column :trades, :uid, :string, null: false
    add_index :trades, :uid, unique: true
  end
end
