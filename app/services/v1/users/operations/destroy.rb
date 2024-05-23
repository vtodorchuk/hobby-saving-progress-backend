# frozen_string_literal: true

module V1
  module Users
    module Operations
      class Destroy < UserService
        def call
          return render(unauthorized, :unauthorized) unless policy.destroy?
          return render(not_found, :not_found) unless user
          return render(can_not_destroy, unprocessable_entity: true) unless user.destroy

          render(nil, :ok)
        end
      end
    end
  end
end
