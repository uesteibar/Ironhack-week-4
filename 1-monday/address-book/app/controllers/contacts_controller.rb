class ContactsController < ApplicationController
  def index
    if params[:initial].present?
      @contacts = Contact.where("UPPER(name) LIKE ?", "#{params[:initial]}%").order(name: :asc)
    else
      @contacts = Contact.all.order(name: :asc)
    end
    render :index
  end

  def index_favorites
    @contacts = Contact.where(favorite: true).order(name: :asc)
    render :index
  end

  def show
    @contact = Contact.find(params[:id])
    render :show
    rescue ActiveRecord::RecordNotFound
      render_404(params)
  end

  def new
    @contact = Contact.new
    render :new
  end

  def create
    contact = Contact.new(contact_params)
    if contact.valid?
      contact.save
      redirect_to contact_path(contact), notice: "Project was successfully created."
    else
      redirect_to action: "new"
    end
  end

  def favorite
    contact = Contact.find(params[:id])
    contact.favorite = true
    contact.save
    redirect_to contact_path(contact)
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to action: "index"
  end

  private

  def render_404(params)
    Rails.logger.warn("Tried to access #{params} which did not exist")
    render 'layouts/404'
  end

  def contact_params
    params.require(:contact).permit(:name, :address, :phone, :email)
  end
end
