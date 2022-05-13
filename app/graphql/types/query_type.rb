module Types
  class QueryType < Types::BaseObject
    field :get_all_users, [Types::UserType], null: false,
      description: "Get all of the Users in the DB"
    def get_all_users
      User.all.includes(:posts, :comments)
    end

    field :get_user, Types::UserType, null: false do
      description "Get a specific User record"

      argument :id, ID, 'A user\'s ID', required: true
    end

    def get_user(id:)
      User.find(id)
    end

    field :get_all_posts, [Types::PostType], null: false do
      description 'Get all of the Posts in the DB'

      argument :limit, Int, 'A limit to the number of records to retreive', required: false
    end

    def get_all_posts(limit: nil)
      Post.eager_load(:user, :comments).all.limit(limit)
    end

    field :get_post_with_title, [Types::PostType], null: false do
      argument :title, String, "The Title you want to search for", required: true
    end

    def get_post_with_title(title: title)
      Post.where('title LIKE ?', title)
    end
  end
end
