class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :trackable, :lockable, authentication_keys: [:phone]

  enum role:    %i[guest admin]
  enum gender:  %i[male female]
end
