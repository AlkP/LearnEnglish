class DayDictionary < ApplicationRecord
  belongs_to :dictionary
  belongs_to :user
end
