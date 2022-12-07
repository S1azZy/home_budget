# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_person

  def current_person
    current_user&.person
  end
end
