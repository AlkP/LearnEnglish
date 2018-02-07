class Dictionary < ApplicationRecord
  enum language:    %i[english german]
  enum vocabulary:  %i[1000 3000]
  enum category:    %i[common people family job]
end
