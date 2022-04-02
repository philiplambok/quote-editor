class HomeController < ApplicationController
  def index
    case params[:as]
    when 'bill'
      session[:user_id] = User.find_by(name: 'Bill').id
    when 'john'
      session[:user_id] = User.find_by(name: 'John').id
    end

    redirect_to notes_path if session[:user_id].present?
  end
end
