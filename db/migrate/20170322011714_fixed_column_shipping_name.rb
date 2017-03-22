class FixedColumnShippingName < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :shippling_name, :shipping_name
  end
end
