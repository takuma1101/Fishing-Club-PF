class Public::CustomersController < ApplicationController

  def show
     @customer = Customer.find(params[:id])
     @customers = current_customer
     @newfish = Fish.new
     @fish = Fish.where(customer_id: @customer.id)
     @fishs = Fish.all
  end

  def edit
    @customer = Customer.find(params[:id])
     if @customer == current_customer
        render "edit"
     else
      redirect_to public_customer_path(current_customer)
     end
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice]="You have updated customer successfully."
      redirect_to public_customer_path(current_customer)
    else
      render :edit
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:profile_image, :user_name, :introduction)
  end
end
