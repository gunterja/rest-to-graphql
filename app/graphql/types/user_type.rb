module Types
  class UserType < Types::BaseObject
    description 'An instance of a User'

    field :id, ID, null: true do
      description 'The ID of the User'
    end

    field :first_name, String, null: true do
      description 'The User\'s first name'
    end

    field :last_name, String, null: true do
      description 'The User\'s last name'
    end

    field :email, String, null: true do
      description 'The User\'s email address'
    end

    field :posts, [Types::PostType], null: true do
      description 'The Posts this user has created'
    end

    field :comments, [Types::CommentType], null: true do
      description 'The comments this user has posted'
    end
  end
end
