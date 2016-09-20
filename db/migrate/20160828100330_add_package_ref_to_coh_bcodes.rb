class AddPackageRefToCohBcodes < ActiveRecord::Migration[5.0]
  def change
    add_reference :coh_bcodes, :package, foreign_key: true
  end
end
