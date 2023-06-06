class Api::V1::RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]

  def index
    #roles = Role.all
    page = params[:page] || 1
    per_page = params[:per_page] || 10
    roles = Role.paginate(page: params[:page], per_page: params[:per_page])
    render json: {
      roles: roles,
      status: "success",
      #roles: roles,
      pagination: {
        current_page: roles.current_page,
        total_pages: roles.total_pages,
        count: roles.total_entries
      },
      message: "Successfully fetched roles details",
    }, status: :ok
    #render json: roles
  end

  def create
    role = Role.new(role_params)
    if role.save
      render json: role, status: :created
    else
      render json: { errors: role.errors.full_messages }, status: :unprocessable_entity
    end
  end
  def show
    render json: @role
  end

  def update
    if @role.update(role_params)
      render json: @role
    else
      render json: { errors: @role.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @role.destroy
    head :no_content
  end

  private

  def set_role
    @role = Role.find(params[:id])
  end

  def role_params
    params.require(:role).permit(:name)
  end
end
