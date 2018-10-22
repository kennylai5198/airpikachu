Rails.configuration.stripe = {
  :publishable_key => 'pk_test_lg6jwLRLazjfSEoBrJ1q1rmR',
  :secret_key => 'sk_test_4tXSVqAr0ZD4C60EzyE0pQ92'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
