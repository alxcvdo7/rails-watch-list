class ListsController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    # @bookmark = Bookmark.new
  end

  def new
    @list = List.new
  end

  def create
    # create a list
    @list = List.new(list_params)
    # save the list
    list.save
    # redirect the user to the list
    redirect_to list_path(@list)
    # need an if?  with invalid params,
    # - assigns a newly created but unsaved list as @list (FAILED - 14)
    # - re-renders the 'new' template (FAILED - 15).

  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
