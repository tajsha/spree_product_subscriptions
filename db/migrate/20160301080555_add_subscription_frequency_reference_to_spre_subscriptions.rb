class AddSubscriptionFrequencyReferenceToSpreSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_reference :spree_subscriptions, :subscription_frequency, index: true
  end
end
