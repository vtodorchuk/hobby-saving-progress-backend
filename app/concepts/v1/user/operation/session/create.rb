module V1
  module User
    module Operation
      module Session
        class Create < Trailblazer::Operation
          step Model(::User, :find_by, :email, not_found_terminus: true)

          step :validate_password
          fail :wrong_password, fail_fast: true

          step :generate_login_token
          step :update_last_login_at

          def validate_password(_ctx, model:, params:, **)
            model.authenticate(params[:password])
          end

          def generate_login_token(ctx, model:, **)
            payload = { user_id: model.id }
            session = JWTSessions::Session.new(payload:)
            ctx[:data] = session.login
          end

          def wrong_password(ctx, **)
            ctx[:data] = [I18n.t('models.users.sessions.errors.wrong_password')]
          end

          def update_last_login_at(_ctx, model:, **)
            model.update(last_login_at: Time.current)
          end
        end
      end
    end
  end
end
