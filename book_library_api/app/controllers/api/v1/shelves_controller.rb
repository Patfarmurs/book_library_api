module Api
  module V1
    class ShelvesController < ApplicationController
      def index
        shelves = Shelf.all
        render json: shelves
      end

      def show
        shelf = Shelf.find(params[:id])
        render json: shelf
      end

      def create
        shelf = Shelf.new(shelf_params)
        if shelf.save
          render json: shelf, status: :created
        else
          render json: shelf.errors, status: :unprocessable_entity
        end
      end

      private

      def shelf_params
        params.require(:shelf).permit(:name)
      end
    end
  end
end

