class Board < ApplicationRecord
    resourcify
    belongs_to :user
    has_many :comments
    paginates_per 5
end
