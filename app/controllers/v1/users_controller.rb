# frozen_string_literal: true

module V1
  class UsersController < ApplicationController
    def show
      render V1::Users::Operations::Show.new(current_user:).call
    end

    def create
      render V1::Users::Operations::Create.new(params:).call
    end

    def update
      render V1::Users::Operations::Update.new(current_user:, params:).call
    end

    def destroy
      render V1::Users::Operations::Destroy.new(current_user:, params:).call
    end
  end
end
