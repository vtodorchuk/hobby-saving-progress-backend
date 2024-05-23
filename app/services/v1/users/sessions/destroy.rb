# frozen_string_literal: true

module V1
  module Users
    module Sessions
      class Destroy < UserService
        def call
          session = JWTSessions::Session.new(refresh_by_access_allowed: true, payload: @payload)
          session.flush_by_access_payload

          render(nil, :ok)
        end
      end
    end
  end
end
