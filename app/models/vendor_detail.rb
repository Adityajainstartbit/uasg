class VendorDetail < ApplicationRecord
  belongs_to :user,  optional: true
  has_one_attached :w9form
  has_one_attached :address_proof
  has_one_attached :photo_id
  
end
