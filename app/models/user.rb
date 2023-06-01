class User < ApplicationRecord
  rolify

  has_and_belongs_to_many :permissions, join_table: :user_permissions
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :api
end
