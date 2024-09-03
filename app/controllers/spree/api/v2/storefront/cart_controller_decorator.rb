module Spree
  module Api
    module V2
      module Storefront
        module CartControllerDecorator
          def self.prepended(base)
            base.before_action :permit_additional_params, only: [:add_item]
          end

          private

          def permit_additional_params
            params.permit(:currency, :locale, :format, :cart, options: [:subscribe, :subscription_frequency_id, :delivery_number])
          end
        end
      end
    end
  end
end

::Spree::Api::V2::Storefront::CartController.prepend Spree::Api::V2::Storefront::CartControllerDecorator
