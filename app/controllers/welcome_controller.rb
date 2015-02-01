class WelcomeController < ApplicationController
  skip_before_action :verify_authenticity_token 

  def index
  end

  def submit
    flash[:notice] = "Successfully charged #{params[:cc_name]} $#{params[:amount]}"
    redirect_to root_path
  end
end
