module Endpoint
  def endpoint(operation, options = {})
    Matcher.new(operation.call(options), options).call do |result|
      return render json: { errors: result[:data] }, status: :unauthorized if unauthorized?
      return render json: { errors: result[:data] }, status: :unproccessed_entity if unproccessed_entity?
      return render json: { errors: result[:data] }, status: :not_found if not_found?
      return render json: result[:data], status: :ok if success?

      render status: :no_content
    end
  end

  class Matcher
    attr_reader :result, :options

    def initialize(result, options = {})
      @result = result
      @options = options
    end

    def call
      return unless block_given?

      yield
    end

    private

    def success?
      result.success?
    end

    def unauthorized?
      result[:'result.policy.default'].success?
    end

    def unproccessed_entity?
      result['model']&.errors&.empty? && result.failure?
    end

    def not_found?
      semantic == :not_found
    end

    def semantic
      @semantic ||= res.event.to_h[:semantic]
    end
  end
end
