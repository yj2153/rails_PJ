class Comment < ApplicationRecord
    resourcify
    belongs_to :board
    belongs_to :user
end
