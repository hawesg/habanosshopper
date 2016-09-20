class CreatePackages < ActiveRecord::Migration[5.0]
  def change
    create_table :packages do |t|
      t.string :name
      t.integer :bsize
      t.integer :multiplier
      t.string :type
      t.boolean :tubo
      t.references :vitola, foreign_key: true

      t.timestamps
    end
  end
end
