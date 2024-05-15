module V1
  module Users
    class SessionsController < ApplicationController
      def create
        render V1::Users::Sessions::Create.new(params:).call
      end

      def destroy
        render V1::Users::Sessions::Destroy(payload:).call
      end
    end
  end
end
