class Permission < ApplicationRecord
    has_and_belongs_to_many :roles, join_table: :role_permissions
    has_and_belongs_to_many :users, join_table: :user_permissions
end
