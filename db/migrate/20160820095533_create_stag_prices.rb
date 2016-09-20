class CreateStagPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :stag_prices do |t|
      t.string :name
      t.float :price
      t.string :stagID
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
