class AddMonthsCountColumnToSpreeSubscriptionFrequencies < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_subscription_frequencies, :months_count, :integer
  end
end
