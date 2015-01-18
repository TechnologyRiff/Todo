class ListsController < ApplicationController
  before_action :authenticate_user!

    def show
      @list = current_user.list
    end

    def new
      @list = List.new
    end

    def create
      @list = List.new(list_params)
      authorize @list
      if @list.save
        redirect_to @list, notice: "List was created successfully."
      else
        flash[:error] = "Error creating list. Please try again."
        render :new
      end
    end

    def update
      @list = List.find(params[:user_id])
      authorize @list
      if @list.update_attributes.require(:id).permit(:title)
        redirect_to @list, notice: "List was updated successfully."
      else
        flash[:error] = "Error saving list. Please try again."
        render :edit
      end
    end

  
    def edit
      @list = List.find(params[:id])
      authorize @list
    end

    def destroy
      @list = List.find(params[:id])
      title = @link.title

      authorize @list
      if @list.destroy
        flash[:notice] = "\"#{title}\" was deleted successfully."
        redirect_to lists_path
      else
        flash[:error] = "There was an error deleting the list."
        render :show
      end
    end

  private 
  def list_params
    params.require(:list).permit(:title)
  end

end