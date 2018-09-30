class UserSerializer < ActiveModel::Serializer
  attributes :id,:username,:email,:birthdate,:created_at,:cards,:addresses

  def birthdate
    object.birthdate.strftime("%A, %B %d %Y")
  end

  def created_at
    object.created_at.strftime("%A, %B %d %Y")
  end
end
