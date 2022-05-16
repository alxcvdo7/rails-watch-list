class BookmarksController < ApplicationController
  before_action :find_list, only: [:new, :create]
  before_action :find_bookmark, only: :destroy

  def new
    @bookmark = Bookmark.new
  end

  def create
    # create bookmark with strong params
    @bookmark = Bookmark.new(bookmark_params)
    # find the list where the bookmark is created and assign it to the bookmark
    @bookmark.list = @list
    if @bookmark.save
      # if bookmark is saved go to show page
      redirect_to list_path(@list)
    else
      # or redirect to the new template
      render :new
    end

  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
  end

  private

  # identify the bookmark
  def find_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

  # strong params to make a valid bookmark
  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  # find the list in which the bookmarks are created/deleted
  def find_list
    @list = List.find(params[:list_id])
  end
end
