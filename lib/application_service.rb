class ApplicationService
  def initialize(options = {})
    options.each do |key, value|
      instance_variable_set(:"@#{key}", value)
    end
  end

  def render(json, status)
    { json:, status: }
  end
end
