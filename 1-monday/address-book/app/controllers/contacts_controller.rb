class ContactsController < ApplicationController
  def index
    @contacts = Contact.all.order(name: :asc)
    render :index
  end

  def show
    @contact = Contact.find(params[:id])
    render :show
  end

  def create

    render :show
  end

  def destroy
    Contact.find(params[:id]).destroy
    render :index
  end
end
