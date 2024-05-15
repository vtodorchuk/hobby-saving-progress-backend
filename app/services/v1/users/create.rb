module V1
  module Users
    class Create < UserService
      def call
        return render(already_exists, :unprocessable_entity) if user
        return render(new_user.errors.full_messages, :unprocessable_entity) unless new_user.save

        render(UserSerializer.new(new_user, :ok))
      end

      private

      def user
        @user ||= User.find_by(email: @params[:email])
      end

      def new_user
        @new_user ||= User.new(@params)
      end
    end
  end
end
