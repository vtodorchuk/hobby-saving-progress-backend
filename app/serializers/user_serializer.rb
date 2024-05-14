class UserSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :email, :created_at, :updated_at

  attribute :full_name do |obj|
    "#{obj.first_name} #{obj.last_name}"
  end
end
