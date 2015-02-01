module WelcomeHelper
  def blank_card_selected
    "selected" if params[:cc_type] == ""
  end

  def visa_card_selected
    "selected" if params[:cc_type] == "visa"
  end

  def mastercard_card_selected
    "selected" if params[:cc_type] == "mastercard"
  end

  def discover_card_selected
    "selected" if params[:cc_type] == "discover"
  end

  def amex_card_selected
    "selected" if params[:cc_type] == "amex"
  end
end
