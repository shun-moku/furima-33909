class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :region
  belongs_to :delivery_date
  has_one :order

  with_options presence: true do
    validates :name
    validates :description
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :region_id
    validates :delivery_date_id
    validates :price
    validates :image
  end

  validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000 }

  belongs_to :user
  has_one_attached :image

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :shipping_charge_id
    validates :region_id
    validates :delivery_date_id
  end
end
