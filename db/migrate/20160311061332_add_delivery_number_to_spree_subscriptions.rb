class AddDeliveryNumberToSpreeSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_subscriptions, :delivery_number, :integer
  end
end
