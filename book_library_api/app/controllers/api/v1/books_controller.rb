module Api
  module V1
    class BooksController < ApplicationController
      def index
        books = Book.order(:title)
        render json: books, include: [:shelf]
      end
    
      def search
        books = Book.where("title ILIKE ? OR author ILIKE ? OR topic ILIKE ?", "%#{params[:query]}%", "%#{params[:query]}%", "%#{params[:query]}%")
        render json: books
      end
    
      def show
        book = Book.find(params[:id])
        render json: book, include: [:loans]
      end
    
      def create
        book = Book.new(book_params)
        if book.save
          render json: book, status: :created
        else
          render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def update
        book = Book.find(params[:id])
        if book.update(book_params)
          render json: book
        else
          render json: { errors: book.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      def destroy
        book = Book.find(params[:id])
        book.destroy
        head :no_content
      end
    
      private
    
      def book_params
        params.require(:book).permit(:title, :author, :topic, :total_count, :shelf_id)
      end
    end
  end
end
