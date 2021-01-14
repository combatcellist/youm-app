class Item < ApplicationRecord
  validates :image
  validates :name
  validates :price, inclusion: { in: (300..9999999)}, format: {with: VALID＿PRICE_LEGEX}
end

belongs_to         :user
has_one_attached   :image
has_one            :order
end
