class WelcomeController < ApplicationController
  def index
    @items = Item.all.order(created_at: :desc)
    
  end
end