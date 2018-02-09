class Dictionary < ApplicationRecord
  enum language:    %i[english german]
  enum vocabulary:  %i[total 1000 3000]
  enum category:    %i[common people family job]

  has_many  :day_dictionaries, dependent: destroy_all
end
