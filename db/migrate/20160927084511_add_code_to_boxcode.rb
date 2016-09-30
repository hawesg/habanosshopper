class AddCodeToBoxcode < ActiveRecord::Migration[5.0]
  def change
    add_column :boxcodes, :code, :string
  end
end
