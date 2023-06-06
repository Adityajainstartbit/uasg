class VendorDetail < ApplicationRecord
  belongs_to :user,  optional: true
  
  has_one_attached :w9form
 # has_one_attached :address_proof
 # has_one_attached :photo_id
   validates :company_name, :first_name,  :email, :password, :telephone, :address, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }
  validates :password, length: { minimum: 8 }
  validates :telephone, numericality: true
  validates :tnc, acceptance: true
    #validates :w9form, presence: true
    #validate :validate_w9form_image_format
  
    def validate_w9form_image_format
      if w9form.attached? && !w9form.content_type.in?(%w(image/jpeg image/png image/gif image/svg+xml image/jpg))
        errors.add(:w9form, "must be a valid image file (JPEG, PNG, GIF, SVG, JPG)")
      end
    end
    

    after_create :create_corresponding_user
    def self.get_vendor_detail
      where(approved: nil)
    end
    
  private

  
  
  def create_corresponding_user
    user = User.new(email: email, password: password, password_confirmation: password)
    user.add_role :vendor
    if user.save
       val=VendorDetail.find_by(email: email)
      #val = VendorDetail.last
     
      val.update(user_id: user.id)
    else
      raise "User already exists"
     
    end
  end
  
  
end
