class AddPaymentReferenceToSpreeSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_reference :spree_subscriptions, :source, index: true
  end
end
