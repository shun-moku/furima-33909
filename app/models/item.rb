class Item < ApplicationRecord


  validates :name,                presence: true
  validates :description,         presence: true
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :shipping_charge_id,  presence: true
  validates :region_id,           presence: true
  validates :delivery_id,         presence: true
  validates :price,               presence: true
  validates :image,               presence: true

  belongs_to :user

end
