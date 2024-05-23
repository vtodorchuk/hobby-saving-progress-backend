# frozen_string_literal: true

module V1
  module Users
    module Operations
      class Show < UserService
        def call
          return render(unauthorized, :unauthorized) unless policy.show?
          return render(not_found, :not_found) unless user

          render(UserSerializer.new(user, :ok))
        end

        private

        def user
          @user ||= User.find_by(email: @params[:email])
        end
      end
    end
  end
end
