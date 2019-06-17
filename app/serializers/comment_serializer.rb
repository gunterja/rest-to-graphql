class CommentSerializer < ActiveModel::Serializer
  attributes(
    *Comment.column_names.map(&:to_sym),
    :comment_author_name,
    :post
  )
end
