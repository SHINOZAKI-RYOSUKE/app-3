class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search_result
    
    @range = params[:range]
    @word_name = params[:word]
    @word_book = params[:word]
    
    if @range == "User"
      @users = User.looks(params[:search], params[:word])
    else
      @books = Book.looks(params[:search], params[:word])
    end
  end
  
end