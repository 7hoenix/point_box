class User < ActiveRecord::Base
  has_secure_password

  enum role: %w(default admin)

  def is_admin?
    role == "admin"
  end
end
