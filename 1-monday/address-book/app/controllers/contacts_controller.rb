class ContactsController < ApplicationController
  def index
    if params[:initial].present?
      @contacts = Contact.where("UPPER(name) LIKE ?", "#{params[:initial]}%").order(name: :asc)
    else
      @contacts = Contact.all.order(name: :asc)
    end
    render :index
  end

  def show
    @contact = Contact.find(params[:id])
    render :show
  end

  def new

    render :show
  end

  def destroy
    Contact.find(params[:id]).destroy
    redirect_to action: "index"
  end
end
