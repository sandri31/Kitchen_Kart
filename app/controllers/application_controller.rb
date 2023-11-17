# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from StandardError, with: :handle_standard_error

  private

  def handle_standard_error(exception)
    flash[:alert] = "An unexpected error occurred: #{exception.message}"
    redirect_to root_path
  end
end
