class CreateBoxcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :boxcodes do |t|
      t.string :name
      t.string :type
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
