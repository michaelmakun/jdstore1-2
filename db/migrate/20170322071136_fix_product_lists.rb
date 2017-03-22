class FixProductLists < ActiveRecord::Migration[5.0]
  def change
    change_column :product_lists, :product_price, 'integer USING CAST(incident_id AS integer)'
  end
end
