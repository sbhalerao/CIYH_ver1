# app/controllers/errors_controller.rb
class ErrorsController < ApplicationController
  ERRORS = [
    :internal_server_error,
    :not_found,
    :unprocessable_entity
  ].freeze
  
  #freeze means the contents of the array cannot be changed. New stuff cannot be added etc
  
  
  #Next we define three actions as included in ERRORS array. For each action, we display an error page.
  # so we need three error pages
  ERRORS.each do |e|
    define_method e do                    #defining dynamic method
      respond_to do |format|
        format.html { render e, :status => e }
        format.any { head e }
      end
    end
  end
end