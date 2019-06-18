module Types
  class PostType < Types::BaseObject
    field :id, ID, "The Post's ID", null: true
    field :title, String, "The title of the post", null: true
    field :body, String, null: true do
      description "The body of the post, may be quite large"
    end
    field :user, Types::UserType, "The User who created this post (UserType)", null: true
    field :comments, [Types::CommentType, null: true], null: true do
      description "This is an array of all the comments that are associated with this post"
    end
    def comments(ids: object.comments.ids)
      RecordLoader.for(Comment).load_many(ids)
    end
  end
end
