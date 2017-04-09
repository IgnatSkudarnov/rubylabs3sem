class User < ApplicationRecord
  def password_filtered
    password.size.times.to_a.map { '*' }.join
  end

  def has_password?(submitted_password)
    password == submitted_password
  end

  def self.authenticate(login, submitted_password)
    user = find_by_login(login)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def save_new_user
    save unless User.find_by_login login
  end

  def update_exist_user(params)
    update(params) if User.find_by_login(params[:login]).nil? || User.find_by_login(params[:login]) == self
  end

  def password
    super
  end

  def save
    super
  end

  def update(params)
    super(params)
  end
end
