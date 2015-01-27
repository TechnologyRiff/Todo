class WelcomeController < ApplicationController
  respond_to :html, :js
  before_action :authenticate_user!

  def index
    @list = current_user.list
    @items = @list.items if @list
    @new_item = Item.new
    @urgent_items = Item.urgent   
    
  end

end
