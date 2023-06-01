class VendorDetailsController < ApplicationController
  before_action :set_vendor_detail, only: [:show, :update, :destroy]

  # GET /vendor_details
  def index
    @vendor_details = VendorDetail.last
   
    render json: {
      status: "success",
      #image_preview: @vendor_details.w9form.attached? ? rails_representation_url(@vendor_details.w9form) : nil
      #image_preview: @vendor_details.w9form.attached? ? rails_blob_url(@vendor_details.w9form) : nil
          image_preview: @vendor_details.w9form.attached? ? 
      (@vendor_details.w9form.image? ? 
        rails_representation_url(@vendor_details.w9form.variant(resize: "200x200")) : 
        rails_blob_url(@vendor_details.w9form)
      ) : nil,

      image_preview2: @vendor_details.address_proof.attached? ? rails_representation_url(@vendor_details.address_proof.variant(resize: "200x200")) : "image not found",
      image_preview3: @vendor_details.photo_id.attached? ?  rails_representation_url(@vendor_details.photo_id.variant(resize: "200x200")) : nil

    }
    #render json: @vendor_details
  end

  # GET /vendor_details/1
  def show
    render json: @vendor_detail
  end

  # POST /vendor_details
  def create
    @vendor_detail = VendorDetail.new(vendor_detail_params)

    if @vendor_detail.save
      #render json: @vendor_detail, status: :created, location: @vendor_detail
      render json: "sucessfully created",status: :created, location: @vendor_detail
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
  # def latest
  #   @vendor_detail = VendorDetail.last.to_json(include: [:w9form])
  #   render json: @vendor_details

  # end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vendor_detail
      @vendor_detail = VendorDetail.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vendor_detail_params
      params.require(:vendor_detail).permit(:company_name, :first_name, :last_name, :email, :address, :w9form, :address_proof, :photo_id, :tnc, :approved, :user_id)
    end
end
