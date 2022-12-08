class Sale < ApplicationRecord
  has_many :sale_comments, dependent: :destroy
end
