module V1
  module Users
    module Sessions
      class Create < UserService
        def call
          return render(unauthorized, :unauthorized) unless user || user&.authenticate(@params[:password])

          payload = { user_id: user.id }
          session = JWTSessions::Session.new(payload:)
          data = session.login

          render(data, :ok)
        end

        private

        def user
          @user ||= User.find_by(email: @params[:email])
        end

        def unauthorized
          @unauthorized ||= I18n.t('models.users.sessions.wrong_password')
        end
      end
    end
  end
end
