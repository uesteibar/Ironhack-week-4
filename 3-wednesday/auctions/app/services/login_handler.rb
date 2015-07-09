
class LoginHandler
  def login(email, password)
    user = User.find_by(email: email, password: password)
    if user.present?
      return user
    end
    nil
  end
end
