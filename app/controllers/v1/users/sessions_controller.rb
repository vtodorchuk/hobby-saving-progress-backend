module V1
  module Users
    class SessionsController < ApplicationController
      def create
        render V1::Users::Session::Create.new(params:).call
      end

      def destroy
        render V1::Users::Session::Destroy(payload:).call
      end
    end
  end
end
