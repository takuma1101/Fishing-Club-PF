class Public::FishsController < ApplicationController
  def new
    @fish = Fish.new
    @customer = current_customer
  end

  def index
     @customer = current_customer
     @fishs = Fish.all
  end

   def create
    @fish = Fish.new(fish_params)
    @fish.customer_id = current_customer.id
     if @fish.save
      flash[:notice]="You have creatad post successfully."
      redirect_to public_fish_path(@fish)
     else
       render :new
     end
   end

  def show
    @fishs = Fish.all
    @fish = Fish.find(params[:id])
    @customer = current_customer
  end

  def edit
  end
  
  def  search
  @section_title = "「#{params[:search]}」の検索結果"
  @fishs = if params[:search].present?
             Fish.where(['title LIKE ? OR body LIKE ?',
                        "%#{params[:search]}%", "%#{params[:search]}%"])
                 .paginate(page: params[:page], per_page: 12).recent
           else
             Fish.none
           end 
  end
end

private

def fish_params
  params.require(:fish).permit(:image, :title, :body)
end