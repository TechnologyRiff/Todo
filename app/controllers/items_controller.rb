class ItemsController < ApplicationController
  respond_to :html, :js

  def new
   
    @item = Item.new
    authorize @item
  end

  def create
    @list = List.find(params[:list_id])
    @items = @list.items

    @item = @list.items.build( item_params )
    
    #authorize @item
    
    if @item.save
      flash[:notice] = "Item was created successfully."
      
    else 
      flash[:error] = "Error creating task. Please try again."
    end

    respond_with(@item) do |format|
       format.html { redirect_to root_path }
    end
  end

  def destroy
    @list = List.find(params[:list_id])
    @item = @list.items.find(params[:id])
  

    if @item.destroy
      flash[:notice] = "Item was deleted."
    else
      flash[:error] = "Item couldn't be deleted. Try again."
    end
 
     respond_with(@item) do |format|
       format.html { redirect_to root_path }
     end
    end
  
  private 
  
  def item_params
    params.require(:item).permit(:name, :completed)
  end

end