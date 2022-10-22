class Public::FishsController < ApplicationController
  def new
    @fish = Fish.new
    @customer = current_customer
  end

  def index
     @customer = current_customer
  end

  def show
  end

  def edit
  end
end

private

def fish_params
  params.require(:fish).permit(:image)
end