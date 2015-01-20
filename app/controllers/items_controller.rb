class ItemsController < ApplicationController
  respond_to :html, :js

  def new
   
    @item = Item.new
    authorize @item
  end

  def create
    @list = List.find(params[:list_id])
    @items = @list.items

    @item = current_user.items.build(item_params)
    @item.list = @list
    authorize @item
    if @item.save
      flash[notice:] = "Item was created successfully."
    else 
      flash[:error] = "Error creating task. Please try again."
    end

    respond_with(@item) do |format|
      format.html { redirect_to [@list, @list.items.new] }
    end
  end

  
  private 
  
  def item_params
    params.require(:item).permit(:name, :completed)
  end

end