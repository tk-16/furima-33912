class Item < ApplicationRecord
  belongs_to :user
  has_one   :purchase, dependent: :destroy
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :content
    validates :category
    validates :condition
    validates :delivery_fee
    validates :delivery_area
    validates :delivery_day
    validates :price
  end

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_day
  belongs_to :delivery_fee


  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 }
  validates :delivery_fee_id, numericality: { other_than: 1 } 
end