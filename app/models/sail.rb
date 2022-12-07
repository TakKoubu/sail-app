class Sail < ApplicationRecord
  has_many :sail_comments, dependent: :destroy
end
