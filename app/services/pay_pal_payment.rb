require 'paypal-sdk-rest'

class PayPalPayment
  include PayPal::SDK::REST

  def self.pay(params)
    PayPal::SDK::REST.set_config(
      :mode => ENV['PAYPAL_MODE'],
      :client_id => ENV['PAYPAL_CLIENT_ID'],
      :client_secret => ENV['PAYPAL_SECRET'])

    # Build Payment object
    # api ref https://developer.paypal.com/webapps/developer/docs/api/#create-a-payment
    payment = Payment.new({
      :intent => "sale",
      :payer => {
        :payment_method => "credit_card",
        :funding_instruments => [{
          :credit_card => {
            :type => params[:cc_type],
            :number => params[:cc_number],
            :expire_month => params[:cc_month],
            :expire_year => params[:cc_year],
            :cvv2 => nil,
            :first_name => params[:first_name],
            :last_name => params[:last_name],
            :billing_address => {
              :line1 => params[:line1],
              :city => params[:city],
              :state => params[:state],
              :postal_code => params[:postal_code],
              :country_code => params[:country_code] }}}]},
      :transactions => [{
        :item_list => {
          :items => [{
            :name => "2015 Conference Purchase",
            :sku => "item",
            :price => params[:amount],
            :currency => "USD",
            :quantity => 1 }]},
        :amount => {
          :total => params[:amount],
          :currency => "USD" },
        :description => params[:description] }]})
    if payment.create
      nil
    else
      payment.error  # Error Hash
    end
  end
end