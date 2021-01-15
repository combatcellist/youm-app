class Item < ApplicationRecord
  
  validates :name, presence: true
  validates :price, presence: true
  validates :content, presence: true
  

  belongs_to         :user
  has_many_attached   :images

end


