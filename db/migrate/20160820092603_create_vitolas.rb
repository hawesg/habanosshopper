class CreateVitolas < ActiveRecord::Migration[5.0]
  def change
    create_table :vitolas do |t|
      t.string :marca
      t.string :vitola
      t.integer :length
      t.integer :rg
      t.string :releaseType
      t.integer :year
      t.string :region

      t.timestamps
    end
  end
end
