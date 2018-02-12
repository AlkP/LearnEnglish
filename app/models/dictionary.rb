class Dictionary < ApplicationRecord
  has_many  :day_dictionaries, dependent: :delete_all

  enum language:    %i[english german]
  enum vocabulary:  %i[total 1000 3000]
  enum category:    %i[common people family job animal country city plant]

  default_scope { order(id: :asc) }

end
