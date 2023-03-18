class Author < ApplicationRecord
    # The name cannot be blank
    validates :name, presence: true, uniqueness: true
    # The e-mail is unique
    validates :email, uniqueness: true
end
