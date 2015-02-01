PayPal::SDK.load("config/paypal.yml", Rails.env)
PayPal::SDK.logger = Rails.logger
module PayPal::SDK::Core::Util::HTTPHelper
  def default_ca_file
    File.expand_path(ENV['SSL_CERT_FILE'])
  end
end
