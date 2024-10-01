class AddSubscriptionFrequencyReferenceToSpreSubscriptions < ActiveRecord::Migration[5.2]
  def change
    add_reference :spree_subscriptions, :subscription_frequency, index: true
  end
end
