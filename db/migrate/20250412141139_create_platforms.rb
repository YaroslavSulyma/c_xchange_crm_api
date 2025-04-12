class CreatePlatforms < ActiveRecord::Migration[8.0]
  def change
    create_table :platforms, id: :uuid do |t|
      t.string :name, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
