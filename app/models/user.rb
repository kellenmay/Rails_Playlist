class User < ApplicationRecord
    has_secure_password
    # .authenticate
    # reader and writers for the password
    # validates the presence of password
  end