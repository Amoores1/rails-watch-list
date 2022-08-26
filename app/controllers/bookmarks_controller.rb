class BookmarksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @bookmark = Bookmark.new(valid_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
      redirect_to list_path(@list), notice: "Bookmark was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(params[:id]), status: :see_other
  end

  private

  def valid_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end
