# frozen_string_literal: true

module V1
  module Sheets
    class SheetsService < ApplicationService
      def policy
        @policy ||= SheetPolicy.new(@current_user, sheet)
      end

      def sheet
        @sheet ||= Sheet.find_by(id: @params[:id])
      end
    end
  end
end
