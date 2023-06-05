


class User < ApplicationRecord
  rolify

  has_and_belongs_to_many :permissions, join_table: :user_permissions
  has_one :vendor_detail

  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :api

  def active_for_authentication?
    super && !(has_role?(:vendor) && !vendor_approved?)
  end

  def vendor_approved?
    vendor_detail = VendorDetail.find_by(user_id: id)
    vendor_detail.present? && vendor_detail.approved?
  end
end
