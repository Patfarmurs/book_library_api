module Api
  module V1
    class CheckoutsController < ApplicationController
      def index
        checkouts = Checkout.all
        render json: checkouts
      end

      def show
        checkout = Checkout.find(params[:id])
        render json: checkout
      end

      def create
        checkout = Checkout.new(checkout_params)
        if checkout.save
          render json: checkout, status: :created
        else
          render json: checkout.errors, status: :unprocessable_entity
        end
      end

      private

      def checkout_params
        params.require(:checkout).permit(:user_id, :book_id, :checkout_date, :return_date, :returned)
      end
    end
  end
end
