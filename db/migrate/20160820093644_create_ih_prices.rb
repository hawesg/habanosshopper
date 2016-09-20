class CreateIhPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :ih_prices do |t|
      t.string :name
      t.float :price
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
