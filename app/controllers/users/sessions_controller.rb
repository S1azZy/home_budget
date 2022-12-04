# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def new
      super
    end
  end
end
