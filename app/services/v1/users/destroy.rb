module V1
  module Users
    class Destroy < UserService
      def call
        return render(unauthorized, :unauthorized) unless policy.destroy?
        return render(not_found, :not_found) unless user
        return render(can_not_destroy, unprocessable_entity: true) unless user.destroy

        render(nil, :ok)
      end

      private

      def user
        @user ||= User.find_by(id: @params[:id])
      end
    end
  end
end
