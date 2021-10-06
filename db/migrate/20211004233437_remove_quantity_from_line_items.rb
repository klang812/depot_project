class RemoveQuantityFromLineItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :line_items, :quantity, :integer
  end
end
