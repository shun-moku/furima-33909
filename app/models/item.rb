class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :region
  belongs_to :delivery_date

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

  validates :price, numericality: { only_integer: true, greater_than: 300, less_than: 9_999_999 }

  belongs_to :user
  has_one_attached :image
  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :shipping_charge_id, numericality: { other_than: 1 }
  validates :region_id, numericality: { other_than: 1 }
  validates :delivery_date_id, numericality: { other_than: 1 }
end
