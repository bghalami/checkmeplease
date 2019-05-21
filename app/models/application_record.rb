class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  private
  
  def error_message
    "Something went wrong, please try again."
  end
end
