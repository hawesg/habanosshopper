class CreateCohBcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :coh_bcodes do |t|
      t.string :name
      t.string :bcode
      t.references :coh_price, foreign_key: true

      t.timestamps
    end
  end
end
