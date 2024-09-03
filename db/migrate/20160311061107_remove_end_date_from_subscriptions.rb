class RemoveEndDateFromSubscriptions < ActiveRecord::Migration[7.1]
  def change
    remove_column :spree_subscriptions, :end_date, :datetime
  end
end
