module V1
  class UsersController < ApplicationController
    def show
      render V1::Users::Show.new(current_user:).call
    end

    def create
      render V1::Users::Create.new(params:).call
    end

    def update
      render V1::Users::Update.new(current_user:, params:).call
    end

    def destroy
      render V1::Users::Destroy.new(current_user:, params:).call
    end
  end
end
