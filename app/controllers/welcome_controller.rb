class WelcomeController < ApplicationController

  def index
    flash[:notice] = "hiiiiiiii"
  end

end
