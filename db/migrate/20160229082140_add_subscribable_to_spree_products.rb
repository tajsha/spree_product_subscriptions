class AddSubscribableToSpreeProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_products, :subscribable, :boolean
    add_index :spree_products, :subscribable
  end
end
