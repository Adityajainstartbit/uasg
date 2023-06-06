class VendorDetailsController < ApplicationController
  before_action :set_vendor_detail, only: [:show, :update, :destroy]
  
  # GET /vendor_details
  def index
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    @vendor_details = VendorDetail.paginate(page: page, per_page: per_page)
  
    vendor_details_data = @vendor_details.map do |vendor_detail|
      {
        company_name: vendor_detail.company_name,
        first_name: vendor_detail.first_name,
        last_name: vendor_detail.last_name,
        email: vendor_detail.email,
        password: vendor_detail.password,
        vendor_telephone: vendor_detail.telephone,
        telephone: vendor_detail.address,
        image_url: vendor_detail.w9form.attached? ? url_for(vendor_detail.w9form) : nil,
        tnc: vendor_detail.tnc,
        approved: vendor_detail.approved
      }
    end
  
    render json: { 
      status: "success",
      vendor_details: vendor_details_data,
      pagination: {
        current_page: @vendor_details.current_page,
        total_pages: @vendor_details.total_pages,
        count: @vendor_details.total_entries
      },
      message: "Successfully fetched vendor details"
    }, status: :ok
  end
  
  
  
  # GET /vendor_details/1
  def show
    #render json: @vendor_detail
    render json: { 
      status: "success",
       
     
      
      vendor_name: @vendor_detail.company_name,
      vendor_firstname: @vendor_detail.first_name,
      vendor_lastname: @vendor_detail.last_name,
      vendor_email: @vendor_detail.email,
      vendor_pasword: @vendor_detail.password,
      vendor_telephone: @vendor_detail.telephone,
      vendor_address: @vendor_detail.address,
      image_url: @vendor_detail.w9form.attached? ? rails_blob_path(@vendor_detail.w9form) : nil,
      vendor_tnc: @vendor_detail.tnc,
      vendor_approved: @vendor_detail.approved,

 
     
      message: "Successfully created" 
    }, status: :created, location: @vendor_detail
  end

  
  def create
    @vendor_detail = VendorDetail.new(vendor_detail_params)

    if @vendor_detail.save
      render json: { 
        status: "success",
         
       
        
        vendor_name: @vendor_detail.company_name,
        vendor_firstname: @vendor_detail.first_name,
        vendor_lastname: @vendor_detail.last_name,
        vendor_email: @vendor_detail.email,
        vendor_pasword: @vendor_detail.password,
        vendor_telephone: @vendor_detail.telephone,
        vendor_address: @vendor_detail.address,
        image_url: @vendor_detail.w9form.attached? ? rails_blob_path(@vendor_detail.w9form) : nil,
        vendor_tnc: @vendor_detail.tnc,
        vendor_approved: @vendor_detail.approved,

   
       
        message: "Successfully created" 
      }, status: :created, location: @vendor_detail
    else
      render json: @vendor_detail.errors, status: :unprocessable_entity
    end
  end
  


  # PATCH/PUT /vendor_details/1
  def update
    if @vendor_detail.update(vendor_detail_params)
      render json: @vendor_detail
    else
      render json: @vendor_detail.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vendor_details/1
  def destroy
    @vendor_detail.destroy
  end
  def approve
    @vendor_details = VendorDetail.find_by(email: params[:email])
    if @vendor_details
      @vendor_details.update(approved: true)
      render json: { message: 'Vendor email approved successfully.' }
    else
      render json: { error: 'Invalid vendor email or unauthorized access.' }, status: :unprocessable_entity
    end
  end
 
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_detail
      @vendor_detail = VendorDetail.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      render json: { status: "error", message: "Vendor not exist" }, status: :not_found
    end
    # def set_vendor_detail
    #   @vendor_detail = VendorDetail.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def vendor_detail_params
      params.require(:vendor_detail).permit(:company_name, :last_name, :first_name, :email, :password,:telephone, :address, :w9form,  :tnc, :approved, :user_id)
    end
   
end
