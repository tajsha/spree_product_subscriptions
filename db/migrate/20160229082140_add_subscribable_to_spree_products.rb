class AddSubscribableToSpreeProducts < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_products, :subscribable, :boolean
    add_index :spree_products, :subscribable
  end
end
