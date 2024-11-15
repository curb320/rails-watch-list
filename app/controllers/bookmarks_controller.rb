class BookmarksController < ApplicationController

  def index
    @bookmarks = Bookmark.all
  end

  def new
    @bookmarks = Bookmark.all
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.create(bookmark_params)
    @bookmark.list_id = params[:list_id]
    @list = List.find(params[:list_id])


    if @bookmark.save

    redirect_to list_path(@list)

    else
      render :new, status: :unprocessable_entity
    end
  end


    def destroy
      @bookmark = Bookmark.find(params[:id])
      @bookmark.destroy
      redirect_to list_path
    end


  private

  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :address_id, :comment)
  end
end
