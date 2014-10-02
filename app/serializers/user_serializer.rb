class UserSerializer < ActiveModel::Serializer
  attributes :id, :name

  def created_at
    object.created_at.strftime('%B %d, %Y')
  end
end
