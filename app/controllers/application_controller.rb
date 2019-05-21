class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  private

  def error_message
    "Something went wrong, please try again."
  end
end
