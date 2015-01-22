class WelcomeController < ApplicationController
  respond_to :html, :js
  before_action :authenticate_user!

  def index
    @list = current_user.list
      @items = @list.items if @list
    
  end

end
