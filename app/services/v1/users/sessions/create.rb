module V1
  module Users
    module Sessions
      class Create < UserService
        def call
          return render(not_found, :not_found) unless user
          return render(wrong_password, :unauthorized) unless user&.authenticate(@params[:password])

          payload = { user_id: user.id }
          session = JWTSessions::Session.new(payload:)
          data = session.login

          user.update(last_login_at: Time.zone.now)

          render(data, :ok)
        end

        private

        def user
          @user ||= User.find_by(email: @params[:email])
        end
      end
    end
  end
end
