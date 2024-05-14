module V1
  module Users
    class UserService < ApplicationService
      def not_found
        @not_found ||= I18n.t('models.users.errors.not_found')
      end

      def can_not_destroy
        @can_not_destroy ||= I18n.t('models.users.errors.can_not_destroy')
      end

      def already_exists
        @already_exists ||= I18n.t('models.users.errors.already_exists')
      end

      def policy
        @policy ||= UserPolicy.new(@current_user, @user)
      end
    end
  end
end
