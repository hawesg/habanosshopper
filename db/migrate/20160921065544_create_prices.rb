class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.string :name
      t.references :package, foreign_key: true
      t.integer  :price_cents,    :default => 0, :null => false
      t.string   :price_currency, :null => false
      t.timestamps
    end
  end
end
