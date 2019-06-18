module Types
  class CommentType < Types::BaseObject
    field :id, ID, 'The ID of the comment', null: true
    field :body, String, 'The body of the comment', null: true
    field :post_id, Integer, 'The ID of the Post this comment is posted on', null: true
    field :user, Types::UserType, 'The User who created this comment', null: true
    def user(id: object.user_id)
      RecordLoader.for(User).load(id)
    end
  end
end
