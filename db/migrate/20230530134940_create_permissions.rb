class CreatePermissions < ActiveRecord::Migration[6.1]
  def change
    create_table :permissions do |t|
      t.string :name
      t.string :category
      t.string :code

      t.timestamps
    end
  end
end
