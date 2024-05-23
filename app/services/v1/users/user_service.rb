# frozen_string_literal: true

module V1
  module Users
    class UserService < ApplicationService
      def unauthorized
        @unauthorized ||= I18n.t('models.users.errors.unauthorized')
      end

      def not_found
        @not_found ||= I18n.t('models.users.errors.not_found')
      end

      def can_not_destroy
        @can_not_destroy ||= I18n.t('models.users.errors.can_not_destroy')
      end

      def already_exists
        @already_exists ||= I18n.t('models.users.errors.already_exists')
      end

      def wrong_password
        @wrong_password ||= I18n.t('models.users.sessions.wrong_password')
      end

      def policy
        @policy ||= UserPolicy.new(@current_user, user)
      end

      def user
        @user ||= User.find_by(id: @params[:id])
      end
    end
  end
end
