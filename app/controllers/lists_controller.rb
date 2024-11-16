class ListsController < ApplicationController
  def index
    @lists = List.all
  end
  def show
    @list = List.find(params[:id])
    @bookmarks = @list.bookmarks


  end
  def new
    @lists = List.all
    @list = List.new
  end
  def create
    @list = List.create(list_params)
    redirect_to root_path
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end
  private

  def list_params
    params.require(:list).permit(:name)
  end
end
