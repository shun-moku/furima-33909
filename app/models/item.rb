class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_charge
  belongs_to :region
  belongs_to :delivery_date


  validates :name,                presence: true
  validates :description,         presence: true
  validates :category_id,         presence: true
  validates :condition_id,        presence: true
  validates :shipping_charge_id,  presence: true
  validates :region_id,           presence: true
  validates :delivery_date_id,    presence: true
  validates :price,               presence: true
  validates :image,               presence: true

  belongs_to :user
  has_one_attached :image
  validates :category_id, numericality: { other_than: 1 } 
  validates :condition_id, numericality: { other_than: 1 } 
  validates :shipping_charge_id, numericality: { other_than: 1 } 
  validates :region_id, numericality: { other_than: 1 } 
  validates :delvery_date_id, numericality: { other_than: 1 }  
end
