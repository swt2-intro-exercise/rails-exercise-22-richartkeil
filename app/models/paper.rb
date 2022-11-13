class Paper < ApplicationRecord
    validates :title, presence: true
    validates :venue, presence: true
    validates :year, presence: true, numericality: { only_integer: true }

    has_and_belongs_to_many :authors

    scope :written_in, ->(year) { where("year = ?", year) }
end
