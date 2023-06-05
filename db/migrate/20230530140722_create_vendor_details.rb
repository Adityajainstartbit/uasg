class CreateVendorDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :vendor_details do |t|
      t.string :company_name
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :telephone
      t.text :address
      t.string :w9form
      #t.string :address_proof
      #t.string :photo_id
      t.boolean :tnc
      t.boolean :approved
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
