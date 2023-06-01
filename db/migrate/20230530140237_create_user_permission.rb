class CreateUserPermission < ActiveRecord::Migration[6.1]
  def change
    create_table :user_permissions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :permission, null: false, foreign_key: true
      t.bigint :select_permision
      t.timestamps
    end
  end
end
