class AddPackageRefToStagBcodes < ActiveRecord::Migration[5.0]
  def change
    add_reference :stag_bcodes, :package, foreign_key: true
  end
end
