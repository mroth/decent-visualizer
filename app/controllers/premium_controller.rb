# frozen_string_literal: true

class PremiumController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def create
    price_id = Stripe::Price.list(active: true, recurring: {interval: "month"}).first.id
    session = Stripe::Checkout::Session.create(
      success_url: "#{success_premium_index_url}?session_id={CHECKOUT_SESSION_ID}",
      cancel_url: cancel_premium_index_url,
      mode: "subscription",
      allow_promotion_codes: true,
      customer_email: current_user.email,
      automatic_tax: {enabled: true},
      metadata: {user_id: current_user.id},
      line_items: [{quantity: 1, price: price_id}],
      tax_id_collection: {enabled: true},
      subscription_data: {trial_period_days: 7}
    )
    redirect_to session.url, allow_other_host: true
  end

  def update
    session = Stripe::BillingPortal::Session.create(
      customer: current_user.stripe_customer_id,
      return_url: shots_url
    )
    redirect_to session.url, allow_other_host: true
  end

  def success
    session = Stripe::Checkout::Session.retrieve(params[:session_id])
    subscription = Stripe::Subscription.retrieve(session.subscription)
    current_user.update(
      stripe_customer_id: session.customer,
      premium_expires_at: Time.zone.at(subscription.current_period_end)
    )
    flash[:notice] = "Subscribing was successful"
    redirect_to shots_path
  end

  def cancel
    flash[:alert] = "Subscribing was cancelled."
    redirect_to shots_path
  end
end
