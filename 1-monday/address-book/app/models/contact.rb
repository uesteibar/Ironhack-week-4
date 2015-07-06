class Contact < ActiveRecord::Base
  validates_presence_of :name, :address
  validate :valid_phone, :valid_email

  def valid_phone
    return true if phone.match(/[0-9]/)
    errors.add(:phone, 'phone number is not valid')
  end

  def valid_email
    return true if email.match(/\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/)
    errors.add(:email, 'email address is not valid')
  end
end
