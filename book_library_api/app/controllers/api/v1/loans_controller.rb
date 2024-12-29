module Api
  module V1
    class LoansController < ApplicationController
      def create
        loan = Loan.new(loan_params)
        if loan.save
          render json: loan, status: :created
        else
          render json: { errors: loan.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def return_book
        loan = Loan.find(params[:id])
        loan.update(returned_at: Time.current)
        render json: loan
      end
    
      private
    
      def loan_params
        params.require(:loan).permit(:book_id, :user_name, :loaned_at)
      end
    end
  end
end
    
