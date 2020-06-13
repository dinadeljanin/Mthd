class User < ApplicationRecord 
    include ActiveModel::Validations

    has_many :categories
    has_many :snippets

    # Validation Checks For User Auth
    validates_presence_of :name, :password          # Forces Presence of string values in form fields
    validates_uniqueness_of :name                   # Forces Uniqueness of User.name in [User.create | New.HTML.erb]

    # Validates User Name and Password
    validates_with NameValidator, PasswordValidator, on: :create

end


