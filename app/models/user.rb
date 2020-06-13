class User < ApplicationRecord 
    include ActiveModel::Validations

    has_many :categories
    has_many :snippets

    # Validation Checks For User Auth
    validates_presence_of :name, :password          # Forces Presence of string values in form fields
    validates_uniqueness_of :name                   # Forces Uniqueness of User.name in [User.create | New.HTML.erb]

    # Validates UserName to not use whitespaces or special characters                     
    validates_with NameValidator, on: :create
    # validates_with PasswordValidator


    validates :password, format: { with: //, 
        message: "Case Sensitive, Requirements: Numbers,letters, the following Special Characters are allowed: !,@,#,$,%,^,&,*,_,- ,=,+,/,\ "}

end


