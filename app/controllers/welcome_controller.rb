class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def index
  end

  def submit
    errors = PayPalPayment.pay params
    errors = nil
    if errors
      flash[:alert] = errors.to_yaml
      return render :index
    end

    flash[:notice] = success_message
    redirect_to root_path
  end

  private
    def success_message
      "Successfully charged #{params[:first_name]} #{params[:last_name]} $#{params[:amount]}"
    end
end
