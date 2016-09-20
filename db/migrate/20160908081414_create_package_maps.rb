class CreatePackageMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :package_maps do |t|
      t.string :name
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
