class AddBCountIdToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :bcount, :integer
  end
end
