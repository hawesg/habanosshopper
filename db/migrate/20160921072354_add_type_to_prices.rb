class AddTypeToPrices < ActiveRecord::Migration[5.0]
  def change
    add_column :prices, :type, :string
  end
end
