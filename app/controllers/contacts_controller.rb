class ContactsController < ApplicationController
  def index
    @contact = Contact.all
  end
  def new
    @contact = Contact.new
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(post_params)
      redirect_to home_path
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to home_path
  end

  def edit
    @contact  = Contact.find(params[:id])
  end

  def create
    # render plain: params[:post].inspect
    @contact = Contact.new(post_params)
    if @contact.save
      redirect_to home_path
    else
      render 'new'
    end
  end

  private def post_params # params
    params.require(:contact).permit(:name,:email, :subject,:message)
  end
end
