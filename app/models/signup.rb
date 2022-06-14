class Signup < ApplicationRecord
    belongs_to :campers
    belongs_to :signup

    validates :time, numericality: {in: 0..23}
end
