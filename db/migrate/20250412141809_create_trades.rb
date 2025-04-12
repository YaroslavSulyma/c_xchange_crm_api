class CreateTrades < ActiveRecord::Migration[8.0]
  def change
    create_table :trades, id: :uuid do |t|
      t.belongs_to :user, foreign_key: true, null: false, type: :uuid
      t.belongs_to :platform, foreign_key: true, null: false, type: :uuid
      t.belongs_to :currency, foreign_key: true, null: false, type: :uuid
      t.belongs_to :fiat_currency, foreign_key: { to_table: :currencies }, null: false, type: :uuid
      t.integer :direction, null: false, index: true
      t.decimal :amount, null: false, precision: 15, scale: 8
      t.decimal :price, null: false, precision: 15, scale: 8
      t.decimal :total, null: false, precision: 20, scale: 4
      t.decimal :fee, null: false, default: 0, precision: 15, scale: 4
      t.date :traded_at, null: false, default: -> { 'NOW()' }, index: true
      t.string :notes, default: ''

      t.timestamps
    end
  end
end
