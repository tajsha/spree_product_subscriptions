class AddOccurencePossibleColumnToSpreeSubscriptions < ActiveRecord::Migration[7.1]
  def change
    add_column :spree_subscriptions, :next_occurrence_possible, :boolean, default: true
  end
end
