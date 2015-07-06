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
  end

  def new
    @contact = Contact.new
    render :new
  end

  def create
    contact = params[:contact]
    contact = Contact.new(name: contact[:name], address: contact[:address], phone: contact[:phone], email: contact[:email])
    if contact.valid?
      contact.save
      redirect_to action: "show", id: contact.id
    else
      redirect_to action: "new"
    end
  end

  def favorite
    contact = Contact.find(params[:id])
    contact.favorite = true
    contact.save
    redirect_to action: "show", id: contact.id
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to action: "index"
  end
end
