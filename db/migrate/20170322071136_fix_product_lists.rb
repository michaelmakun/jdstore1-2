class FixProductLists < ActiveRecord::Migration[5.0]
  def change
    change_column :product_lists, :product_price, 'integer USING CAST'
  end
end
