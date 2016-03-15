require "spec_helper"

describe Spree::Subscription do

  describe "validations" do
    it { expect(subject).to validate_presence_of(:quantity) }
    it { expect(subject).to validate_presence_of(:delivery_number) }
    it { expect(subject).to validate_presence_of(:price) }
    it { expect(subject).to validate_presence_of(:number) }
    it { expect(subject).to validate_presence_of(:variant) }
    it { expect(subject).to validate_presence_of(:parent_order) }
    it { expect(subject).to validate_presence_of(:frequency) }
    context "if cancelled present" do
      before { subject.cancelled = true }
      it { expect(subject).to validate_presence_of(:cancellation_reasons) }
      it { expect(subject).to validate_presence_of(:cancelled_at) }
    end
    context "if enabled" do
      before { subject.enabled = true }
      it { expect(subject).to validate_presence_of(:ship_address) }
      it { expect(subject).to validate_presence_of(:bill_address) }
      it { expect(subject).to validate_presence_of(:last_occurrence_at) }
      it { expect(subject).to validate_presence_of(:source) }
    end
    it { expect(subject).to validate_numericality_of(:price).is_greater_than_or_equal_to(0).allow_nil }
    it { expect(subject).to validate_numericality_of(:quantity).is_greater_than(0).only_integer.allow_nil }
    it { expect(subject).to validate_numericality_of(:delivery_number).is_greater_than_or_equal_to(subject.send :recurring_orders_size).only_integer.allow_nil }
  end

  describe "associations" do
    it { expect(subject).to belong_to(:ship_address).class_name("Spree::Address") }
    it { expect(subject).to belong_to(:bill_address).class_name("Spree::Address") }
    it { expect(subject).to belong_to(:parent_order).class_name("Spree::Order") }
    it { expect(subject).to belong_to(:variant).inverse_of(:subscriptions) }
    it { expect(subject).to belong_to(:frequency).class_name("Spree::SubscriptionFrequency").with_foreign_key(:subscription_frequency_id) }
    it { expect(subject).to belong_to(:source) }
    it { expect(subject).to have_many(:orders_subscriptions).class_name("Spree::OrderSubscription").dependent(:destroy) }
    it { expect(subject).to have_many(:orders).through(:orders_subscriptions) }
    it { expect(subject).to have_many(:complete_orders).conditions(:complete).through(:orders_subscriptions).source(:order) }
    it { expect(subject).to accept_nested_attributes_for(:ship_address) }
    it { expect(subject).to accept_nested_attributes_for(:bill_address) }
  end

  describe "callbacks" do
    it { expect(subject).to callback(:set_last_occurrence_at).before(:validation).if(:can_set_last_occurence_at?) }
    it { expect(subject).to callback(:set_cancelled_at).before(:validation).if(:can_set_cancelled_at?) }
    it { expect(subject).to callback(:notify_cancellation).after(:update).if(:cancellation_notifiable?) }
    it { expect(subject).to callback(:notify_reoccurrence).after(:update).if(:reoccurrence_notifiable?) }
    it { expect(subject).to callback(:not_cancelled?).before(:update) }
    it { expect(subject).to callback(:notify_user).after(:update).if(-> { enabled? && enabled_changed? }) }
  end

  describe "scopes" do
  end

  describe "methods" do
  end

end
