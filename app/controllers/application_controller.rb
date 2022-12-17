# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_person
  around_action :use_person_time_zone, if: :current_person

  def use_person_time_zone(&)
    # TODO: remake it to store in db
    zone = "Asia/Makassar"
    Time.use_zone(zone, &)
  end

  def current_person
    current_user&.person
  end
end
