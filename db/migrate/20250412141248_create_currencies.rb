class CreateCurrencies < ActiveRecord::Migration[8.0]
  def change
    create_table :currencies, id: :uuid do |t|
      t.string :code, null: false, index: { unique: true }
      t.integer :kind, null: false, default: 0

      t.timestamps
    end
  end
end
