class AddEnabledToSpreeSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_subscriptions, :enabled, :boolean, default: false
  end
end
