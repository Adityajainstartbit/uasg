class Api::V1::RolesController < ApplicationController
    def index
        roles = Role.all
        render json: roles
      end
    
      def create
        role = Role.new(role_params)
        if role.save
          render json: role, status: :created
        else
          render json: { errors: role.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def update
        role = Role.find(params[:id])
        if role.update(role_params)
          render json: role
        else
          render json: { errors: role.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def destroy
        role = Role.find(params[:id])
        role.destroy
        head :no_content
      end
    
      private
    
      def role_params
        params.require(:role).permit(:name)
      end
end
