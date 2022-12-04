# frozen_string_literal: true

# TODO: переделать это все нахрен!
module Users
  class RegistrationsController < Devise::RegistrationsController
    private

    def sign_up_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
  end
end
