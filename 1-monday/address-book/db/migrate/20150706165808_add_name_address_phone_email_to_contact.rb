class AddNameAddressPhoneEmailToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :name, :string
    add_column :contacts, :address, :string
    add_column :contacts, :phone, :string
    add_column :contacts, :email, :string
  end
end
