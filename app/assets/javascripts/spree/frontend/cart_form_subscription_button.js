Spree.ready(function($) {
  Spree.addToCartFormSubmissionOptions = function(obj) {
    $cartForm = obj;
    if($cartForm.find("input[name='subscription[subscription_frequency_id]']:checked").val() > 0) {
      options = {
        subscribe: true,
        subscription_frequency_id: $cartForm.find("input[name='subscription[subscription_frequency_id]']:checked").val(),
        delivery_number: parseInt($cartForm.find('#subscription_delivery_number').val())
      };
      return options;
    }
    return {};
  }
})
