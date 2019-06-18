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
  end
end
