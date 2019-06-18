class PostSerializer < ActiveModel::Serializer
  attributes(
    *Post.column_names.map(&:to_sym),
    :author_name,
    :comments
  )
end
