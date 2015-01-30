class ListsController < ApplicationController
  before_action :authenticate_user!

    def show
      @list = current_user.list
      @items = @list.items if @list
      @new_item = Item.new
      #authorize @list 
    end

    def new
      @list = List.new
    end

    def create
      @list = List.new(list_params)
      @list.user = current_user
      authorize @list
      if @list.save
        redirect_to :root, notice: "List was created successfully."
      else
        flash[:error] = "Error creating list. Please try again."
        render :new
      end
    end

    def update
      @list = List.find(params[:id])
      authorize @list
      if @list.update_attributes(list_params)
        redirect_to :root, notice: "List was updated successfully."
      else
        flash[:error] = "Error saving list. Please try again."
        render :edit
      end
    end

  
    def edit
      @list = current_user.list
    
    end

    def destroy
      @list = List.find(params[:id])
      title = @list.title

      authorize @list
      if @list.destroy
        flash[:notice] = "\"#{title}\" was deleted successfully."
        redirect_to :root
      else
        flash[:error] = "There was an error deleting the list."
        redirect_to :root
      end
    end

  private 
  def list_params
    params.require(:list).permit(:title) #, :description)
  end

end