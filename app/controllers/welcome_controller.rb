class WelcomeController < ApplicationController
  def index
  end

  def submit
    flash[:notice] = 'Successfully paid'
    redirect_to root_path
  end
end
