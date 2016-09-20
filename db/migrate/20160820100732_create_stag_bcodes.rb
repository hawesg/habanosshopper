class CreateStagBcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :stag_bcodes do |t|
      t.string :stagID
      t.string :name
      t.string :bcode
      t.references :stag_price, foreign_key: true

      t.timestamps
    end
  end
end
