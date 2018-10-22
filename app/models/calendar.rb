class Calendar < ApplicationRecord
  enum status: [:Available, :NotAvailable] # by default, 1st argument is 0; 2nd argument is 1
  validates :day, presence: true 
  belongs_to :room
end
