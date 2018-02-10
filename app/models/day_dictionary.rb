class DayDictionary < ApplicationRecord
  belongs_to :dictionary, optional: true
  belongs_to :user,       optional: true
end
