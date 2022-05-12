class BookmarksController < ApplicationController
  def new
    raise
    @bookmark = Bookmark.new
  end

  def create
    # find the list to create the bookmark
    @list = List.find(params[:list_id])
    # create the bookmark
    @bookmark = Bookmark.new(bookmark_params)
    #
    @bookmark.list = @list
    # redirect to the list
    # redirect_to list_path(@list)
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
