module V1
  module Users
    class SessionsController < ApplicationController
      def create
        endpoint(V1::User::Operation::Session::Create, current_user:, params:)
      end

      def destroy
        endpoint(V1::User::Operation::Session::Destroy, current_user:, payload:)
      end
    end
  end
end
