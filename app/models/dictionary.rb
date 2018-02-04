class Dictionary < ApplicationRecord
  enum language:  %i[english german]
  enum category:  %i[common people family job]
end
