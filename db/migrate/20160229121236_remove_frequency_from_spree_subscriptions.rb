class RemoveFrequencyFromSpreeSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :spree_subscriptions, :frequency, :string
  end
end
