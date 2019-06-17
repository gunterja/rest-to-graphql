class UserSerializer < ActiveModel::Serializer
  attributes(
    *User.column_names.map(&:to_sym),
    :full_name,
    :posts
  )
end
