module Api
  module V1
    class BooksController < ApplicationController
      def index
        books = Book.order(:title)
        render json: books
      end

      def show
        book = Book.find(params[:id])
        render json: book
      end

      def create
        book = Book.new(book_params)
        if book.save
          render json: book, status: :created
        else
          render json: book.errors, status: :unprocessable_entity
        end
      end

      def check_out
        book = Book.find(params[:id])
        if book.available_quantity > 0
          checkout = book.checkouts.create(user_id: params[:user_id], checkout_date: Date.today, returned: false)
          render json: checkout, status: :created
        else
          render json: { error: 'Book not available' }, status: :unprocessable_entity
        end
      end

      def check_in
        checkout = Checkout.find_by(book_id: params[:id], user_id: params[:user_id], returned: false)
        if checkout
          checkout.update(returned: true, return_date: Date.today)
          render json: checkout
        else
          render json: { error: 'Checkout record not found' }, status: :unprocessable_entity
        end
      end

      private

      def book_params
        params.require(:book).permit(:title, :author, :topic, :quantity, :shelf_id)
      end
    end
  end
end