module V1
  module Users
    class Update < UserService
      def call
        return render(unauthorized, :unauthorized) unless policy.update?
        return render(already_exists, :unprocessable_entity) unless user
        return render(UserSerializer.new(user, :ok)) if user.update(@params)

        render(user.errors.full_messages, :unprocessable_entity)
      end

      private

      def user
        @user ||= User.find_by(email: @params[:email])
      end
    end
  end
end
