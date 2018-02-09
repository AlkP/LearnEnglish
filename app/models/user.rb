class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :timeoutable and :omniauthable
  # :recoverable, :rememberable, :validatable
  devise :database_authenticatable, :registerable, :trackable, :lockable, authentication_keys: [:phone]

  enum role:    %i[guest admin]
  enum status:  %i[open closed]
  enum gender:  %i[male female]

  has_many  :day_dictionaries, dependent: destroy_all
  has_many  :families_parent, class_name: 'Family', foreign_key: 'child_id'
  has_many  :families_child, class_name: 'Family',foreign_key: 'parent_id'
  has_many  :parents,  class_name: 'User', foreign_key: 'parent_id', through: :families_parent
  has_many  :children, class_name: 'User', foreign_key: 'child_id',  through: :families_child

  def self.find_by_telegram_id(id)
    where("status = ? and telegram_id = ?", 0, id).first
  end
end
