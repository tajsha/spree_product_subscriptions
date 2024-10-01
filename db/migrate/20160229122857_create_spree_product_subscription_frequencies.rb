class CreateSpreeProductSubscriptionFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :spree_product_subscription_frequencies do |t|
      t.references :product, index: {name: 'spree_product_subscription_frequencies'}
      t.references :subscription_frequency
    end
  end
end
