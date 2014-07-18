class HomeController < ApplicationController
  layout :resolve_layout
  
  def index
    @user = User.new
  end

  def usuario

  end

private

  def resolve_layout
    case action_name
	    when "usuario"
	      "home_authenticated"
	    else
	      "application"
	 end
  end

end
